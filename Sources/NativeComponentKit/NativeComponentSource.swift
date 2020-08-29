import Foundation

/// Each framework containing components should have one source that registers
/// all its components
public protocol NativeComponentSource {
    func register(on registry: NativeComponentRegistry)
}
