//
//  ShortIsoDate.swift
//  Tomorrow
//
//  Created by Łukasz Szarkowicz on 20/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//
// ISODate representation is yyyy-MM-dd

import Foundation

public extension Date {
    /**
     Short Date Formatter: f.ex. 2021-01-28
     */
    static let shortIsoDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter
    }()
    
    var shortIsoDateString: String {
        return Date.shortIsoDateFormatter.string(from: self)
    }
}

public extension String {
    var shortIsoDate: Date? {
        return Date.shortIsoDateFormatter.date(from: self)
    }
}
