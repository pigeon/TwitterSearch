//
//  FullScreenFullScreenConfiguratorTests.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 03/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

@testable import ImageSearch
import XCTest

class FullScreenModuleConfiguratorTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {
        // given
        let viewController = FullScreenViewControllerMock()
        let configurator = FullScreenModuleConfigurator()

        // when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "FullScreenViewController is nil after configuration")
        XCTAssertTrue(viewController.output is FullScreenPresenter, "output is not FullScreenPresenter")

        let presenter: FullScreenPresenter = viewController.output as! FullScreenPresenter
        XCTAssertNotNil(presenter.view, "view in FullScreenPresenter is nil after configuration")
    }

    class FullScreenViewControllerMock: FullScreenViewController {
        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
