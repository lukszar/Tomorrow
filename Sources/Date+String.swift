//
//  Date+String.swift
//  Tomorrow
//
//  Created by Lukasz Szarkowicz on 04/04/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import Foundation

public extension Date {
    
    /**
     Create Date from given ISO8601 String using Tomorrow Kit.
     
     It recognize by itself different formats of string dates, including version with milliseconds and without. F.ex:
     
     _"2020-11-01T21:10:56Z"_,
     
     _"2020-11-01T21:10:56.715+01:00"_,
    
     _"2020-11-01T21:10:56.22+02:00"_
     
     - Author: Łukasz Szarkowicz @ Mobilee
     
     - parameter string: Date in String format conforming __ISO8601 Standard__
     
     - returns: Date object created from given string.
     */
    func fromISO(_ string: String) -> Date? {
        return Tomorrow.date(from: string)
    }
}
