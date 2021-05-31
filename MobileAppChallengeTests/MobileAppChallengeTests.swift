//
//  MobileAppChallengeTests.swift
//  MobileAppChallengeTests
//
//  Created by Sabrina Hoque Tuli on 31/5/21.
//

import XCTest
@testable
import MobileAppChallenge
class MobileAppChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let manager = TransportManager()
            XCTAssertTrue(manager.trans.count == 0, "Start with empty Transport list")
            manager.addItem()
            XCTAssertTrue(manager.trans.count == 1, "Should have one Transport afer adding")
            manager.addItem()
            manager.addItem() // added 3 transport
            manager.delete(at: [1])
            XCTAssertTrue(manager.trans.count == 2, "Should have 2 items in Transport list")    }

    

}
