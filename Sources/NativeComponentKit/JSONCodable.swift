import Foundation

public struct JSONCodable<T: Codable>: DataConvertible {
    private let value: T

    public init(_ value: T) {
        self.value = value
    }
    
    public func asData(with encoder: NativeComponentEncoder) throws -> Data {
        try encoder.encode(value)
    }
}

extension JSONCodable: HasNativeComponentID where T: HasNativeComponentID {
    public var componentId: NativeComponentID { value.componentId }
}
