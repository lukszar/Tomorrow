//
//  DateInterval+Components.swift
//  Tomorrow
//
//  Created by Łukasz Szarkowicz on 17/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Foundation

@available(iOS 10.0, tvOSApplicationExtension 10.0, tvOS 10.0, watchOSApplicationExtension 3.0, OSXApplicationExtension 10.12, macOS 10.12, *)
public extension DateInterval {
    
    /**
     Calculates duration using given components.
     
     F.ex. if difference between dates is 26h and you calculate duration using .day and .hour components it will return 1 day and 2h.
     
     - parameter components: Components which will be considered to return results for.
     
     - returns: Duration between given dates in format of DateComponents
     */
    func duration(representedBy components: Set<Calendar.Component>) -> DateComponents {
        return Calendar.current.dateComponents(components, from: start, to: end)
    }
    
    /**
     Calculates duration using given one component.
     
     - parameter component: Component which will be considered to return results for.
     
     - returns: Duration between given dates in format of DateComponents
     */
    func duration(representedBy component: Calendar.Component) -> DateComponents {
        let comp: Set<Calendar.Component> = [component]
        return Calendar.current.dateComponents(comp, from: start, to: end)
    }
    
    func inYears() -> Int {
        duration(representedBy: .year).year ?? 0
    }
    
    func inMonths() -> Int {
        duration(representedBy: .month).month ?? 0
    }
    
    func inDays() -> Int {
        duration(representedBy: .day).day ?? 0
    }
    
    func inHours() -> Int {
        duration(representedBy: .hour).hour ?? 0
    }
    
    func inMinutes() -> Int {
        duration(representedBy: .minute).minute ?? 0
    }
    
    func inSeconds() -> Int {
        duration(representedBy: .second).second ?? 0
    }
    
    @available(iOS 15.0, tvOSApplicationExtension 15.0, tvOS 15.0, watchOSApplicationExtension 8.0, OSXApplicationExtension 12.0, macOS 12.0, *)
    func shortDescription() -> String {
        return (start..<end).formatted(.components(style: .narrow, fields: [.year, .month, .day, .hour, .minute, .second]))
    }
    
    /**
     Creates String description for time interval between start and end dates. Format uses `short` style.
     
     - parameter maxUnitsCount: Number of units included in presentation
     
     - returns: String describing time interval.
     */
    func durationDescription(maxUnitsCount: Int = 1) -> String {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth, .month, .year]
        dateComponentsFormatter.maximumUnitCount = maxUnitsCount
        dateComponentsFormatter.unitsStyle = .short
        return dateComponentsFormatter.string(from: start, to: end) ?? ""
    }
}
