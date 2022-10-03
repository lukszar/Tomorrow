//
//  DateWeekdayTests.swift
//  Tomorrow-iOSTests
//
//  Created by Łukasz Szarkowicz on 03/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

@testable import Tomorrow
import XCTest

class DateWeekdayTests: XCTestCase {

    // TODO: add language setup on launch and use string validation in tests.
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWeekdayName() {
        let date = Tomorrow.date(from: "2022-10-28T15:26:41.715+01:00")
        XCTAssertNotNil(date?.weekdayName)
    }

}
