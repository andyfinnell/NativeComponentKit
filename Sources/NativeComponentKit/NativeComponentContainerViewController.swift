import Foundation
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

// TODO: support collections as well

public final class NativeComponentContainerViewController: NativeViewController, NativeComponentContainer {
    private let realView = NativeComponentContainerView()
    private weak var componentViewController: NativeViewController?
    
    public var nativeComponent: NativeComponent? {
        willSet {
            nativeComponentWillChange()
        }
        didSet {
            nativeComponentDidChange()
        }
    }
    
    public override func loadView() {
        view = realView
    }
    
    // TODO: implement stuffs
}

private extension NativeComponentContainerViewController {
    func nativeComponentWillChange() {
        realView.componentView = nil
        componentViewController?.removeFromParent()
    }
    
    func nativeComponentDidChange() {
        switch nativeComponent?.ui {
        case let .view(view):
            realView.componentView = view
        case let .viewController(viewController):
            addChild(viewController)
            realView.componentView = viewController.view
            componentViewController = viewController
        case .none:
            break // nothing to do
        }
    }
}
