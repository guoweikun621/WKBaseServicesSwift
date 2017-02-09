//
//  IntExtension.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2017/2/9.
//  Copyright © 2017年 郭伟坤. All rights reserved.
//

import UIKit

public extension Int {
    var year: DateComponents {
        return DateComponents(year: self)
    }
    
    var years: DateComponents {
        return year
    }
    
    var month: DateComponents {
        return DateComponents(month: self)
    }
    
    var months: DateComponents {
        return month
    }
    
    var week: DateComponents {
        return DateComponents(day: 7 * self)
    }
    
    var weeks: DateComponents {
        return week
    }
    
    var day: DateComponents {
        return DateComponents(day: self)
    }
    
    var days: DateComponents {
        return day
    }
    
    var hour: DateComponents {
        return DateComponents(hour: self)
    }
    
    var hours: DateComponents {
        return hour
    }
    
    var minute: DateComponents {
        return DateComponents(minute: self)
    }
    
    var minutes: DateComponents {
        return minute
    }
    
    var second: DateComponents {
        return DateComponents(second: self)
    }
    
    var seconds: DateComponents {
        return second
    }
    
    var nanosecond: DateComponents {
        return DateComponents(nanosecond: self)
    }
    
    var nanoseconds: DateComponents {
        return nanosecond
    }
}
