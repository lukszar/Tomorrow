//
//  DateComponents.swift
//  Tomorrow
//
//  Created by Łukasz Szarkowicz on 21/06/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Check if date is the same day as today
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    /// Check if date is the same day as tomorrow
    var isTomorrow: Bool {
        Calendar.current.isDateInTomorrow(self)
    }
    
    /// Check if date is the same day as yesterday
    var isYesterday: Bool {
        Calendar.current.isDateInYesterday(self)
    }
    
    /// Calculate next day from current
    func nextDay() -> Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self) ?? Date()
    }
    
    /// Calculate previous day from current
    func previousDay() -> Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self) ?? Date()
    }
    
    /// Remove time components from date
    func dateWithoutTime() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return Calendar.current.date(from: components) ?? Date()
    }
}
