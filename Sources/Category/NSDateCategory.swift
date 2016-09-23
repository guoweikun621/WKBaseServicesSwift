//
//  DateCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/19.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import Foundation


extension NSDate {
    
    /**
     格式化日期为String
     
     - parameter formatterStyle: 风格 eg yyyy/MM/dd HH:mm:ss
     
     - returns: 返回格式化后日期字符串
     */
    public func formtter(formatterStyle: String) -> String {
        let formater = NSDateFormatter.init()
        formater.locale = NSLocale.init(localeIdentifier: "zh_CN")
        formater.dateFormat = formatterStyle
        return formater.stringFromDate(self)
    }
    
    /**
     格式化为 yyyy-MM-dd HH:mm:ss 字符串
     
     - returns: 返回格式化后日期字符串
     */
    public func yyyyMMddHHmmss() -> String {
        return self.formtter("yyyy-MM-dd HH:mm:ss")
    }
}