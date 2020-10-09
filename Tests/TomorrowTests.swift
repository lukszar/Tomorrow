//
//  TomorrowTests.swift
//  TomorrowTests
//
//  Created by Łukasz Szarkowicz on 04.04.2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

@testable import Tomorrow
import XCTest

class TomorrowTests: XCTestCase {
    
    var calendar: Calendar!
    var dates: [String: TomorrowTests.DateHelper]!
    
//    static var allTests = [
//        ("testStringToDateConvertShouldReturnNotNil", testStringToDateConvertShouldReturnNotNil),
//        ("testOldFormatterShouldReturnNotNil", testOldFormatterShouldReturnNotNil),
//        ("testNewFormatterShouldReturnNotNil", testNewFormatterShouldReturnNotNil),
//        ("testNewFormatterShouldReturnCorrectDateComponents", testNewFormatterShouldReturnCorrectDateComponents)
//    ]

    override func setUp() {
        
        // Setup calendar for tests
        calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(abbreviation: "GMT")!

        // Prepare example dates to examine formatter.
        dates = [:]
        dates["2016-11-01T21:10:56Z"] = DateHelper(year: 2016, month: 11, day: 01, hour: 21, minute: 10, seconds: 56)
        dates["2004-02-12T15:19:21+00:00"] = DateHelper(year: 2004, month: 02, day: 12, hour: 15, minute: 19, seconds: 21)
        dates["2011-10-05T14:48:00.000Z"] = DateHelper(year: 2011, month: 10, day: 05, hour: 14, minute: 48, seconds: 0)
        dates["2008-10-31T15:26:41.715+01:00"] = DateHelper(year: 2008, month: 10, day: 31, hour: 14, minute: 26, seconds: 41)
        dates["2016-11-29T11:30:32.7+01:00"] = DateHelper(year: 2016, month: 11, day: 29, hour: 10, minute: 30, seconds: 32)
        dates["2017-07-31T15:39:30.22+02:00"] = DateHelper(year: 2017, month: 07, day: 31, hour: 13, minute: 39, seconds: 30)
        dates["2010-10-31T00:00:00+02:00"] = DateHelper(year: 2010, month: 10, day: 30, hour: 22, minute: 0, seconds: 0)
        dates["2013-07-16T19:00:00Z"] = DateHelper(year: 2013, month: 07, day: 16, hour: 19, minute: 0, seconds: 0)

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testStringToDateConvertShouldReturnNotNil() {
        for element in dates.keys {
            let date = Tomorrow.date(from: element)
            XCTAssertNotNil(date)
        }
    }
    
    
    func testOldFormatterShouldReturnNotNil() {
        let formatter = OldISO8601Formatter()
        for element in dates.keys {
            let date = formatter.date(from: element)
            XCTAssertNotNil(date)
        }
    }
    
    @available(iOS 11.2.1, tvOSApplicationExtension 11.0, tvOS 11.0, watchOSApplicationExtension 4.0, OSXApplicationExtension 10.13, macOS 10.13, *)
    func testNewFormatterShouldReturnNotNil() {
        let formatter = NewISO8601Formatter()
        for element in dates.keys {
            let date = formatter.date(from: element)
            XCTAssertNotNil(date)
        }
    }
    
    @available(iOS 11.2.1, tvOSApplicationExtension 11.0, tvOS 11.0, watchOSApplicationExtension 4.0, OSXApplicationExtension 10.13, macOS 10.13, *)
    func testNewFormatterShouldReturnCorrectDateComponents() {
        let formatter = NewISO8601Formatter()
        
        for (dateString, components) in dates {
            let date = formatter.date(from: dateString)
            XCTAssertNotNil(date)
            
            compareDateComponents(date!, component: components)
        }
    }
    
    
    func testOldFormatterForConversion() {
        let formatter = OldISO8601Formatter()
        
        for (dateString, components) in dates {
            let date = formatter.date(from: dateString)
            XCTAssertNotNil(date)
            
            compareDateComponents(date!, component: components)
        }
    }
    
    func compareDateComponents(_ date: Date, component: DateHelper) {
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        XCTAssertEqual(year, component.year, "Wrong year - \(year) - should be \(component.year) ")
        XCTAssertEqual(month, component.month, "Wrong month - \(month) - should be \(component.month) ")
        XCTAssertEqual(day, component.day, "Wrong day - \(day) - should be \(component.day) ")
        XCTAssertEqual(hour, component.hour, "Wrong hour - \(hour) - should be \(component.hour) ")
        XCTAssertEqual(minute, component.minute, "Wrong minute - \(minute) - should be \(component.minute) ")
        XCTAssertEqual(seconds, component.seconds, "Wrong seconds - \(seconds) - should be \(component.seconds) ")
    }
    
    func testStringToDate() {
        for (dateString, components) in dates {
            let date = Date.fromISO(dateString)
            
            XCTAssertNotNil(date)
    
            compareDateComponents(date!, component: components)
        }
    }
    
    @available(iOS 11.2.1, tvOSApplicationExtension 11.0, tvOS 11.0, watchOSApplicationExtension 4.0, OSXApplicationExtension 10.13, macOS 10.13, *)
    func testNewFormatterConversionWhenInvalidStringProvidedShouldReturnNil() {
        // Arrange
        let newFormatter = NewISO8601Formatter()
        let dateString = "This is not valid date string"
        
        // Act
        let newDate = newFormatter.date(from: dateString)
       
        // Asserts
        XCTAssertNil(newDate)
    }
    
    func testConversionWhenInvalidStringProviderShouldReturnNil() {
        // Arrange
        let oldFormatter = OldISO8601Formatter()
        let dateString = "This is not valid date string"
        // Act
        let oldDate = oldFormatter.date(from: dateString)
        let date = Tomorrow.date(from: dateString)
        // Asserts
        XCTAssertNil(date)
        XCTAssertNil(oldDate)
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    struct DateHelper {
        let year: Int
        let month: Int
        let day: Int
        let hour: Int
        let minute: Int
        let seconds: Int
    }
}

