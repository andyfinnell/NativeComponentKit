import Foundation

public enum NativeComponentError: Error {
    case unknownComponent(NativeComponentID)
    case componentIDNotFound
}
