//
//  IntExtension.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2017/2/9.
//  Copyright © 2017年 郭伟坤. All rights reserved.
//

import UIKit

extension Int {
    public var year: DateComponents {
        return DateComponents(year: self)
    }
    
    public var years: DateComponents {
        return year
    }
    
    public var month: DateComponents {
        return DateComponents(month: self)
    }
    
    public var months: DateComponents {
        return month
    }
    
    public var week: DateComponents {
        return DateComponents(day: 7 * self)
    }
    
    public var weeks: DateComponents {
        return week
    }
    
    public var day: DateComponents {
        return DateComponents(day: self)
    }
    
    public var days: DateComponents {
        return day
    }
    
    public var hour: DateComponents {
        return DateComponents(hour: self)
    }
    
    public var hours: DateComponents {
        return hour
    }
    
    public var minute: DateComponents {
        return DateComponents(minute: self)
    }
    
    public var minutes: DateComponents {
        return minute
    }
    
    public var second: DateComponents {
        return DateComponents(second: self)
    }
    
    public var seconds: DateComponents {
        return second
    }
    
    public var nanosecond: DateComponents {
        return DateComponents(nanosecond: self)
    }
    
    public var nanoseconds: DateComponents {
        return nanosecond
    }
}
