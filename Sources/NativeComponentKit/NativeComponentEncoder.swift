import Foundation

public protocol NativeComponentEncoder {
    func encode<T: Encodable>(_ value: T) throws -> Data
}

extension JSONEncoder: NativeComponentEncoder {}

enum DefaultEncoder {
    static let json: NativeComponentEncoder = {
       let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
}
