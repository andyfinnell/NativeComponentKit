import Foundation
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

final class NativeComponentContainerView: NativeView {
    weak var componentView: NativeView? {
        willSet {
            componentViewWillChange()
        }
        didSet {
            componentViewDidChange()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        componentView?.intrinsicContentSize ?? .zero
    }
}

private extension NativeComponentContainerView {
    func componentViewWillChange() {
        componentView?.removeFromSuperview()
    }
    
    func componentViewDidChange() {
        // TODO: setup constraints, remove the old, etc
        if let view = componentView {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            view.topAnchor.constraint(equalTo: topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
        
        invalidateIntrinsicContentSize()
    }
}
