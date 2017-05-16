//
//  DateCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/19.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import Foundation


extension Date {
    
    /// 创建一个日期对象
    ///
    /// - parameter era:        纪元
    /// - parameter year:       年份
    /// - parameter month:      月份
    /// - parameter day:        天数
    /// - parameter hour:       时
    /// - parameter minute:     分
    /// - parameter second:     秒
    /// - parameter nanosecond: 毫秒
    /// - parameter calendar:   日历
    ///
    /// - returns: The created `Date` instance.
    public init(era: Int?, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int, on calendar: Calendar) {
        let now = Date()
        var dateComponents = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond], from: now)
        dateComponents.era = era
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.nanosecond = nanosecond
        
        let date = calendar.date(from: dateComponents)
        self.init(timeInterval: 0, since: date!)
    }
    
    
    /// 创建一个日期对象
    ///
    /// - Parameters:
    ///   - year: 年
    ///   - month: 月
    ///   - day: 日
    ///   - hour: 时
    ///   - minute: 分
    ///   - second: 秒
    ///   - nanosecond: 毫秒
    public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int = 0) {
        self.init(era: nil, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond, on: .current)
    }
    
    
    /// 创建一个日期对象
    ///
    /// - Parameters:
    ///   - year: 年
    ///   - month: 月
    ///   - day: 日
    public init(year: Int, month: Int, day: Int) {
        self.init(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    }
    
    
    /// 今天的日期
    ///
    /// - Returns: 今天
    public static func today() -> Date {
        let now = Date()
        return Date(year: now.year, month: now.month, day: now.day)
    }
    
    
    /// 昨天
    ///
    /// - Returns: 昨天
    public static func yesterday() -> Date {
        return (today() - 1.day)!
    }
    
    /// 明天
    ///
    /// - 明天
    public static func tomorrow() -> Date {
        return (today() + 1.day)!
    }
    
    /// Creates a new instance added a `DateComponents`
    ///
    /// - parameter left:  The date.
    /// - parameter right: The date components.
    ///
    /// - returns: The created `Date` instance.
    public static func + (left: Date, right: DateComponents) -> Date? {
        return Calendar.current.date(byAdding: right, to: left)
    }
    
    /// Creates a new instance subtracted a `DateComponents`
    ///
    /// - parameter left:  The date.
    /// - parameter right: The date components.
    ///
    /// - returns: The created `Date` instance.
    public static func - (left: Date, right: DateComponents) -> Date? {
        return Calendar.current.date(byAdding: -right, to: left)
    }
    
    /// 更改当前日期对象的值，返回一个日期对象
    ///
    /// - Parameters:
    ///   - year: 年
    ///   - month: 月
    ///   - day: 日
    ///   - hour: 时
    ///   - minute: 分
    ///   - second: 秒
    ///   - nanosecond: 毫秒
    /// - Returns: 日期Date
    public func changed(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, nanosecond: Int? = nil) -> Date? {
        var dateComponents = self.dateComponents
        dateComponents.year = year ?? self.year
        dateComponents.month = month ?? self.month
        dateComponents.day = day ?? self.day
        dateComponents.hour = hour ?? self.hour
        dateComponents.minute = minute ?? self.minute
        dateComponents.second = second ?? self.second
        dateComponents.nanosecond = nanosecond ?? self.nanosecond
        
        return calendar.date(from: dateComponents)
    }
    
    /// 更改当前日期年份
    ///
    /// - Parameter year: 年
    /// - Returns: Date instance
    public func changed(year: Int) -> Date? {
        return changed(year: year, month: nil, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }
    
    /// 更改当前日期月份
    ///
    /// - Parameter month: 月
    /// - Returns: Date instance.
    public func changed(month: Int) -> Date? {
        return changed(year: nil, month: month, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }
    
    /// 更改当前日期日子
    ///
    /// - Parameter day: 日
    /// - Returns: Date instance.
    public func changed(day: Int) -> Date? {
        return changed(year: nil, month: nil, day: day, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }
    
    /// 更改当前日期小时
    ///
    /// - Parameter hour: 时
    /// - Returns: Date instance.
    public func changed(hour: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: hour, minute: nil, second: nil, nanosecond: nil)
    }
    
    /// 更改当前日期分钟
    ///
    /// - Parameter minute: 分钟
    /// - Returns: Date instance.
    public func changed(minute: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: nil, minute: minute, second: nil, nanosecond: nil)
    }
    
    /// 更改当前日期秒
    ///
    /// - Parameter second: 秒
    /// - Returns: Date instance.
    public func changed(second: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: nil, minute: nil, second: second, nanosecond: nil)
    }
    
    /// 更改当前日期毫秒数
    ///
    /// - Parameter nanosecond: 毫秒
    /// - Returns: Date instance.
    public func changed(nanosecond: Int) -> Date? {
        return changed(year: nil, month: nil, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nanosecond)
    }
    
    /// 更改当前日期周数
    ///
    /// - Parameter weekday: 周
    /// - Returns: Date instance.
    public func changed(weekday: Int) -> Date? {
        return self - (self.weekday - weekday).days
    }
    
    /// 年
    public var year: Int {
        return dateComponents.year!
    }
    
    /// 月
    public var month: Int {
        return dateComponents.month!
    }
    
    /// 日
    public var day: Int {
        return dateComponents.day!
    }
    
    /// 时
    public var hour: Int {
        return dateComponents.hour!
    }
    
    /// 分
    public var minute: Int {
        return dateComponents.minute!
    }
    
    /// 秒
    public var second: Int {
        return dateComponents.second!
    }
    
    /// 毫秒
    public var nanosecond: Int {
        return dateComponents.nanosecond!
    }
    
    /// 周几
    public var weekday: Int {
        return dateComponents.weekday!
    }
    
    private var dateComponents: DateComponents {
        return calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday], from: self)
    }
    
    // Returns user's calendar to be used to return `DateComponents` of the receiver.
    private var calendar: Calendar {
        return .current
    }
    
    
    /**
     格式化日期为String
     
     - parameter formatterStyle: 风格 eg yyyy/MM/dd HH:mm:ss
     
     - returns: 返回格式化后日期字符串
     */
    public func formtter(formatterStyle: String) -> String {
        let formater = DateFormatter()
        formater.locale = Locale.cnLocal()
        formater.timeZone = TimeZone.current
        formater.dateFormat = formatterStyle
        return formater.string(from: self)
    }
    
    
    /// string value with formatter style
    ///
    /// - Parameter style: 格式化方式
    /// - Returns: 日期字符串
    public func stringValue(formatter style: String) -> String {
        return formtter(formatterStyle: style)
    }
    
    /**
     格式化为 yyyy-MM-dd HH:mm:ss 字符串
     
     - returns: 返回格式化后日期字符串
     */
    public func yyyyMMddHHmmss() -> String {
        return self.formtter(formatterStyle: "yyyy-MM-dd HH:mm:ss")
    }
    
    
    /// 格式化为 yyyy-MM-dd
    ///
    /// - Returns: 返回日期字符串
    public func yyyyMMdd() -> String {
        return formtter(formatterStyle: "yyyy-MM-dd")
    }
}
