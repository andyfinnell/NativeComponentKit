import Foundation

/**
 Components are really plugins. They are independent of the context they appear in.
 i.e. They have low coupling with the context they appear in.
 
 For example, a "feed" where each entry is a card advertising or presenting new
 information. One card doesn't know/care about the other. The container of the
 feed also doesn't need to know what's in each card. They're self-contained.
 Therefore, the cards could be modeled as components.
 
 A component isn't something essential to the context's behavior. For example,
 in an ecommerce checkout flow, the shopping cart isn't independent as it
 contains the list of items to buy. There's intrinsic coupling between the cart
 and the checkout flow. Therefore, the cart wouldn't be modeled as a component.
 There could still be some modularization between the card and the checkout flow
 but a component wouldn't satisfy the requirements because of the coupling.
 */
public protocol NativeComponent {
    // TODO: UI components should be able to be: part of a screen, a full screen, or a UI flow
    var ui: NativeUI { get }
}
