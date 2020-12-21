//
//  ImagesImagesConfiguratorTests.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

@testable import ImageSearch
import XCTest

class ImagesModuleConfiguratorTests: XCTestCase {
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
        let viewController = ImagesViewControllerMock()
        let configurator = ImagesModuleConfigurator()

        // when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ImagesViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ImagesPresenter, "output is not ImagesPresenter")

        let presenter: ImagesPresenter = viewController.output as! ImagesPresenter
        XCTAssertNotNil(presenter.view, "view in ImagesPresenter is nil after configuration")

        let interactor: ImagesInteractor = presenter.interactor as! ImagesInteractor
        XCTAssertNotNil(interactor.output, "output in ImagesInteractor is nil after configuration")
    }

    class ImagesViewControllerMock: ImagesViewController {
        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
