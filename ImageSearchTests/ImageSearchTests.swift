//
//  ImageSearchTests.swift
//  ImageSearchTests
//
//  Created by Dmytro Golub on 28/03/2018.
//

@testable import ImageSearch
import XCTest

class ImageSearchTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBase64() {
        XCTAssertTrue(base64Token(key: "f2a1ed52710d4533bde25be6da03b6e3",
                                  secret: "6779ef20e75817b79602") ==
                "ZjJhMWVkNTI3MTBkNDUzM2JkZTI1YmU2ZGEwM2I2ZTM6Njc3OWVmMjBlNzU4MTdiNzk2MDI=", "base64 encoding is wrong")
    }
}
