//
//  TimeFormatterTests.swift
//  Tomorrow-iOSTests
//
//  Created by Łukasz Szarkowicz on 18/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

@testable import Tomorrow
import XCTest

class TimeFormatterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTimeDescription() {
        let date = Date.fromISO("2022-10-28T15:26:41.715+01:00")
        let time = date?.timeDescription
        
        XCTAssertEqual(time, "16:26")
    }
    

}
