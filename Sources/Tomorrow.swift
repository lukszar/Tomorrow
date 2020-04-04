//
//  Tomorrow.swift
//  Tomorrow
//
//  Created by Łukasz Szarkowicz on 04.04.2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

// Include Foundation
@_exported import Foundation

public class Tomorrow {
    
    /// Hide init for Library.
    private init() {}
    
    /// Singleton for keeping one instance of Formatter in memory
    static private let shared = Tomorrow()
    
    lazy var formatter: ISO8601Formatter = {
        if #available(iOS 11.0, tvOSApplicationExtension 11.0, tvOS 11.0, watchOSApplicationExtension 4.0, OSXApplicationExtension 10.13, macOS 10.13, *) {
            return NewISO8601Formatter()
        } else {
            /// For system version lower than iOS 11.0
            return OldISO8601Formatter()
        }
    }()

    public static func date(from string: String) -> Date? {
        return shared.formatter.date(from: string)
    }
}
