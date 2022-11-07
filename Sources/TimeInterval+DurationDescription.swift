//
//  TimeInterval+DurationDescription.swift
//  Tomorrow
//
//  Created by Łukasz Szarkowicz on 07/11/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Foundation

@available(iOS 10.0, tvOSApplicationExtension 10.0, tvOS 10.0, watchOSApplicationExtension 3.0, OSXApplicationExtension 10.12, macOS 10.12, *)
public extension TimeInterval {
    
    /**
     Creates String description for given TimeInterval. Format uses `short` style.
     
     This is facade to DateInterval extension.
     
     - parameter maxUnitsCount: Number of units included in presentation
     
     - returns: String describing time interval.
     */
    func durationDescription(maxUnitsCount: Int = 1) -> String {
        let interval = DateInterval(start: Date(), duration: abs(self))
        return interval.durationDescription(maxUnitsCount: maxUnitsCount)
    }
}
