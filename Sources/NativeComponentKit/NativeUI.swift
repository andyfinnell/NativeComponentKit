import Foundation
#if canImport(AppKit)
import AppKit

public typealias NativeView = NSView
public typealias NativeViewController = NSViewController

// TODO: what about window?

#elseif canImport(UIKit)
import UIKit

public typealias NativeView = UIView
public typealias NativeViewController = UIViewController

#endif

public enum NativeUI {
    case view(NativeView)
    case viewController(NativeViewController)
    
    // TODO: what about SwiftUI?
}
