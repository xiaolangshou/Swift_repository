import XCTest

class UITestDemoUITests: XCTestCase {

    func testExample() {
        let element = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.tap()
        element.tap()
        element.swipeDown()
    }

}


