import Foundation

public protocol HasNativeComponentID {
    var componentId: NativeComponentID { get }
}

public enum NativeComponentParameters {
    case externalData(DataConvertible, id: NativeComponentID)
    case internalJsonData(Data) // assumes JSON with NativeComponentID at component_id
    case internalValue(DataConvertible & HasNativeComponentID)
    case internalJsonValue(JSONValue) // assumes NativeComponentID at component_id
    
    public static func value<T: Codable>(_ value: T, id: NativeComponentID) -> NativeComponentParameters {
        .externalData(JSONCodable(value), id: id)
    }
    
    public static func value<T>(_ value: T) -> NativeComponentParameters where T: Codable, T: HasNativeComponentID {
        .internalValue(JSONCodable(value))
    }
    
    public static func value(_ data: Data) -> NativeComponentParameters {
        .internalJsonData(data)
    }
    
    public static func value(_ data: Data, id: NativeComponentID) -> NativeComponentParameters {
        .externalData(data, id: id)
    }
    
    public static func value(_ value: JSONValue) -> NativeComponentParameters {
        .internalJsonValue(value)
    }
}
