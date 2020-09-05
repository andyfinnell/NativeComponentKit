import Foundation
import XCTest
import NativeComponentKit

final class BannerView: NativeView {
    
}

final class BannerComponent: NativeComponent {
    private let title: String
    private let bannerView = BannerView()
    
    var ui: NativeUI { .view(bannerView) }
    
    init(title: String) {
        self.title = title
    }
}

final class BannerComponentFactory: NativeComponentFactory {
    struct CreateParameter: Codable {
        let title: String
    }
    
    let id = NativeComponentID("com.losingfight.banner")
    
    func create(from parameter: CreateParameter) throws -> NativeComponent {
        BannerComponent(title: parameter.title)
    }
}

final class BannerKitSource: NativeComponentSource {
    // TODO: demonstrate DI here
    
    func register(on registry: NativeComponentRegistry) {
        let bannerFactory = BannerComponentFactory()
        registry.install(bannerFactory)
    }
}

final class BasicComponentTests: XCTestCase {
    private var componentStore: NativeComponentStore!
    
    override func setUp() {
        super.setUp()
        
        componentStore = NativeComponentStore()
            
        let bannerSource = BannerKitSource()
        componentStore.install(bannerSource)
    }
    
    func testSetup() throws {
        struct OutsideParameter: Codable, HasNativeComponentID {
            let componentId: NativeComponentID
            let title: String
        }
        
        let parameters = OutsideParameter(componentId: NativeComponentID("com.losingfight.banner"),
                                          title: "Hello world!")
        XCTAssertNoThrow(try componentStore.create(from: .value(parameters)))
    }
}
