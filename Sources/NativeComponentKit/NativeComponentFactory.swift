import Foundation

public protocol NativeComponentFactory {
    associatedtype CreateParameter: Decodable
    
    var id: NativeComponentID { get }
    var decoder: NativeComponentDecoder { get }
    var encoder: NativeComponentEncoder { get }
    
    func create(from parameter: CreateParameter) throws -> NativeComponent
}

public extension NativeComponentFactory {
    var decoder: NativeComponentDecoder { DefaultDecoder.json }
    var encoder: NativeComponentEncoder { DefaultEncoder.json }
}
