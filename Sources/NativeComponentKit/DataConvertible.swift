import Foundation

public protocol DataConvertible {
    func asData(with encoder: NativeComponentEncoder) throws -> Data
}

extension Data: DataConvertible {
    public func asData(with encoder: NativeComponentEncoder) throws -> Data {
        self
    }
}

