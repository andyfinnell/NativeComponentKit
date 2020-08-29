import Foundation

public protocol NativeComponentRegistry {
    func install<F: NativeComponentFactory>(_ factory: F)
}
