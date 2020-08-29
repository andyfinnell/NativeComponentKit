import Foundation

public final class NativeComponentStore {
    private var sources = [NativeComponentSource]()
    private var factories = [NativeComponentID: Factory]()

    public init() {}
    
    public func install<S: NativeComponentSource>(_ source: S) {
        sources.append(source)
        let registry = SourceRegistry(source: source) { id, factory in
            self.factories[id] = factory
        }
        source.register(on: registry)
    }
    
    public func create(from parameters: NativeComponentParameters) throws -> NativeComponent {
        let id = try parameters.id()
        guard let factory = factories[id] else {
            throw NativeComponentError.unknownComponent(id)
        }
        
        return try factory.create(parameters)
    }
}

// TODO: this type probably not necessary anymore
private struct SourceRegistry {
    private let source: NativeComponentSource
    private let install: (NativeComponentID, Factory) -> Void
    
    init(source: NativeComponentSource, install: @escaping (NativeComponentID, Factory) -> Void) {
        self.source = source
        self.install = install
    }
}

extension SourceRegistry: NativeComponentRegistry {
    public func install<F>(_ factory: F) where F : NativeComponentFactory {
        let thunk = { (input: NativeComponentParameters) throws -> NativeComponent in
            let data = try input.data(with: factory.encoder)
            let parameter = try factory.decoder.decode(F.CreateParameter.self, from: data)
            return try factory.create(from: parameter)
        }
        let factoryThunk = Factory(create: thunk)
        install(factory.id, factoryThunk)
    }
}

private extension NativeComponentParameters {
    private struct ID: Codable {
        let componentId: NativeComponentID
    }
     
    func id() throws -> NativeComponentID {
        switch self {
        case let .externalData(_, id: id):
            return id
        case let .internalJsonData(data):
            let id = try DefaultDecoder.json.decode(ID.self, from: data)
            return id.componentId
        case let .internalValue(value):
            return value.componentId
        }
    }
    
    func data(with encoder: NativeComponentEncoder) throws -> Data {
        switch self {
        case let .externalData(data, id: _):
            return try data.asData(with: encoder)
        case let .internalJsonData(data):
            return data
        case let .internalValue(value):
            return try value.asData(with: encoder)
        }
    }
}

private struct Factory {
    let create: (NativeComponentParameters) throws -> NativeComponent
}
