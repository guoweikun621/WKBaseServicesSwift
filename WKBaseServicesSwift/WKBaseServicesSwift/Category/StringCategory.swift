//
//  StringCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/19.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import Foundation

extension String {
    
    /**
     日期值
     
     - parameter formatterStyle: 格式化风格 如： yyyy-MM-dd HH:mm:ss
     
     - returns: NSDate 
     */
    public func dateValue(formatterStyle: String) -> NSDate? {
        let formatter = NSDateFormatter.init()
        formatter.locale = NSLocale.init(localeIdentifier: "zh_CN")
        formatter.dateFormat = formatterStyle
        return formatter.dateFromString(self)
    }
}
