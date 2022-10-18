//
//  DateIntervalComponentTests.swift
//  Tomorrow-iOSTests
//
//  Created by Łukasz Szarkowicz on 17/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import XCTest
@testable import Tomorrow

@available(iOS 10.0, tvOSApplicationExtension 10.0, tvOS 10.0, watchOSApplicationExtension 4.0, OSXApplicationExtension 10.12, macOS 10.12, *)
class DateIntervalComponentTests: XCTestCase {
    
    var startDate: Date!
    var endDate: Date!
    var interval: DateInterval!
    var calendar: Calendar!
    
    override func setUp() {
        calendar = Calendar(identifier: .gregorian)
        startDate = Tomorrow.date(from: "2022-07-15T19:30:00Z")
        endDate = Tomorrow.date(from: "2022-07-16T21:00:00Z")
        
        interval = DateInterval(start: startDate, end: endDate)
       
    }

    override func setUpWithError() throws {

        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testYears() {
        let years = interval.inYears()
        XCTAssertEqual(years, 0)
    }
    
    func testMonths() {
        let months = interval.inMonths()
        XCTAssertEqual(months, 0)
    }
    
    func testDays() {
        let days = interval.inDays()
        XCTAssertEqual(days, 1)
    }
    
    func testHours() {
        let hours = interval.inHours()
        XCTAssertEqual(hours, 25)
    }
    
    func testMinutes() {
        let minutes = interval.inMinutes()
        XCTAssertEqual(minutes, 1530)
    }
    
    func testDuration() {
        let comps = interval.duration(representedBy: [.day, .hour])
        
        XCTAssertEqual(comps.day, 1)
        XCTAssertEqual(comps.hour, 1)
    }
    
    func testDescription() {
        let desc = interval.durationDescription(maxUnitsCount: 2)
        
        XCTAssertEqual(desc, "1 doba i 2 godz.")
    }
}
