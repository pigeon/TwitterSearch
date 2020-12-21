//
//  ImagesImagesInteractorTests.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

@testable import ImageSearch
import XCTest

class ImagesInteractorTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockPresenter: ImagesInteractorOutput {
        func images(_: [String]) {
        }

        func error(_: NSError) {
        }
    }
}
