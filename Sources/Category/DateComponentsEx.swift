//
//  DateComponentsExtension.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2017/2/9.
//  Copyright © 2017年 郭伟坤. All rights reserved.
//

import UIKit

extension DateComponents {
    
    
    /// 前一天
    public var ago: Date? {
        return Calendar.current.date(byAdding: -self, to: Date())
    }
    
    
    /// 后一天
    public var later: Date? {
        return Calendar.current.date(byAdding: self, to: Date())
    }
    
    /// 创建负日期组件
    ///
    /// - parameter rhs: 日期组件
    ///
    /// - returns: DateComponents
    public static prefix func -(rhs: DateComponents) -> DateComponents {
        var dateComponents = DateComponents()
        
        if let year = rhs.year {
            dateComponents.year = -year
        }
        
        if let month = rhs.month {
            dateComponents.month = -month
        }
        
        if let day = rhs.day {
            dateComponents.day = -day
        }
        
        if let hour = rhs.hour {
            dateComponents.hour = -hour
        }
        
        if let minute = rhs.minute {
            dateComponents.minute = -minute
        }
        
        if let second = rhs.second {
            dateComponents.second = -second
        }
        
        if let nanosecond = rhs.nanosecond {
            dateComponents.nanosecond = -nanosecond
        }
        
        return dateComponents
    }
    
    /// 日期组件加法
    ///
    /// - parameter left:  左边日期组件
    /// - parameter right: 右边日期组件
    ///
    /// - returns: DateComponents instance.
    public static func + (left: DateComponents, right: DateComponents) -> DateComponents {
        var dateComponents = left
        
        if let year = right.year {
            dateComponents.year = (dateComponents.year ?? 0) + year
        }
        
        if let month = right.month {
            dateComponents.month = (dateComponents.month ?? 0) + month
        }
        
        if let day = right.day {
            dateComponents.day = (dateComponents.day ?? 0) + day
        }
        
        if let hour = right.hour {
            dateComponents.hour = (dateComponents.hour ?? 0) + hour
        }
        
        if let minute = right.minute {
            dateComponents.minute = (dateComponents.minute ?? 0) + minute
        }
        
        if let second = right.second {
            dateComponents.second = (dateComponents.second ?? 0) + second
        }
        
        if let nanosecond = right.nanosecond {
            dateComponents.nanosecond = (dateComponents.nanosecond ?? 0) + nanosecond
        }
        
        return dateComponents
    }
    
    /// 日期组件减法
    ///
    /// - parameter left:  左边日期组件
    /// - parameter right: 右边日期组件
    ///
    /// - returns: DateComponents instance.
    public static func - (left: DateComponents, right: DateComponents) -> DateComponents {
        return left + (-right)
    }
}
