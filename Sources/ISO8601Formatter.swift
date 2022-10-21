//
//  ISO8601Formatter.swift
//  Tomorrow
//
//  Created by Lukasz Szarkowicz on 04/04/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import Foundation

protocol ISO8601Formatter {
    func date(from string: String) -> Date?
    func string(from date: Date, milliseconds: Bool) -> String
}

class OldISO8601Formatter: ISO8601Formatter {
    
    /// Formatter for ISO8601 with milliseconds
    lazy var iso8601FormatterWithMilliseconds: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        return dateFormatter
    }()
    
    /// Formatter for ISO8601 without milliseconds
    lazy var iso8601Formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        return dateFormatter
    }()
    
    func date(from string: String) -> Date? {
        if let date = iso8601Formatter.date(from: string) {
            return date
        } else if let date = iso8601FormatterWithMilliseconds.date(from: string) {
            return date
        } else {
            debugPrint("Could not parse \(string) into Date format.")
            return nil
        }
    }
    
    func string(from date: Date, milliseconds: Bool) -> String {
        if milliseconds {
            return iso8601FormatterWithMilliseconds.string(from: date)
        } else {
            return iso8601Formatter.string(from: date)
        }
    }
}

@available(iOS 11.2.1, tvOSApplicationExtension 11.0, tvOS 11.0, watchOSApplicationExtension 4.0, OSXApplicationExtension 10.13, macOS 10.13, *)
class NewISO8601Formatter: ISO8601Formatter {
    
    /// Formatter for ISO8601 with milliseconds
    lazy var iso8601FormatterWithMilliseconds: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        
        // GMT or UTC -> UTC is standard, GMT is TimeZone
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.formatOptions = [.withInternetDateTime,
                                   .withDashSeparatorInDate,
                                   .withColonSeparatorInTime,
                                   .withTimeZone,
                                   .withFractionalSeconds]

        return formatter
    }()
    
    /// Formatter for ISO8601 without milliseconds
    lazy var iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        
        // GMT or UTC -> UTC is standard, GMT is TimeZone
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.formatOptions = [.withInternetDateTime,
                                   .withDashSeparatorInDate,
                                   .withColonSeparatorInTime,
                                   .withTimeZone]

        return formatter
    }()
    
    func date(from string: String) -> Date? {
        if let date = iso8601Formatter.date(from: string) {
            return date
        } else if let date = iso8601FormatterWithMilliseconds.date(from: string) {
            return date
        } else {
            debugPrint("Could not parse \(string) into Date format.")
            return nil
        }
    }
    
    func string(from date: Date, milliseconds: Bool) -> String {
        if milliseconds {
            return iso8601FormatterWithMilliseconds.string(from: date)
        } else {
            return iso8601Formatter.string(from: date)
        }
    }
}
