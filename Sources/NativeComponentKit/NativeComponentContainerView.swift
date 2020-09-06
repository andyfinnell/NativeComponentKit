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
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        componentView?.intrinsicContentSize ?? .zero
    }
}

private extension NativeComponentContainerView {
    func resetHugging() {
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
    }
    
    func commonInit() {
        resetHugging()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func componentViewWillChange() {
        componentView?.removeFromSuperview()
        resetHugging()
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
            setContentHuggingPriority(view.contentHuggingPriority(for: .horizontal), for: .horizontal)
            setContentHuggingPriority(view.contentHuggingPriority(for: .vertical), for: .vertical)
        }
        
        invalidateIntrinsicContentSize()
    }
}
