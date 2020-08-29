import Foundation

public protocol NativeComponentDecoder {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

extension JSONDecoder: NativeComponentDecoder {}

enum DefaultDecoder {
    static let json: NativeComponentDecoder = {
       let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
