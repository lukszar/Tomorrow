//
//  TimeFormatter.swift
//  Tomorrow
//
//  Created by Łukasz Szarkowicz on 18/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.calendar = .autoupdatingCurrent
        return formatter
    }()
}

public extension Date {
    var timeDescription: String {
        DateFormatter.timeFormatter.string(from: self)
    }
}
