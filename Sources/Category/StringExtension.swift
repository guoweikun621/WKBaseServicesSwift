//
//  StringCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/19.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import Foundation

extension String {
    
    /// url 转码
    public var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
    
    
    /**
     日期值
     
     - parameter formatterStyle: 格式化风格 如： yyyy-MM-dd HH:mm:ss
     
     - returns: NSDate 
     */
    public func dateValue(formatterStyle: String) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.calendar = Calendar.current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = formatterStyle
        return formatter.date(from: self)
    }
    
    
    /// 转换成日期类型
    ///
    /// - Parameter format: 格式
    /// - Returns: Date
    public func date(inFormat format: String) -> Date? {
        return dateValue(formatterStyle: format)
    }
    
    
    /// 汉字转拼音
    ///
    /// - Returns: 拼音
    public func pinyin() -> String? {
        //转成了可变字符串
        let str = NSMutableString(string: self)
        //先转换为带声调的拼音
        CFStringTransform(str as CFMutableString, nil, kCFStringTransformMandarinLatin, false)
        //再转换为不带声调的拼音
        CFStringTransform(str as CFMutableString, nil, kCFStringTransformStripDiacritics, false);
        return str.lowercased;
    }
}
