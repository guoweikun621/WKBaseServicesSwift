//
//  StringCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/19.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import Foundation

extension String {
    
    /// 字符串长度
    public var lenght: Int {
        get {
            return self.characters.count
        }
    }
    
    
    /// url 转码
    public var urlEscaped: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) ?? ""
    }
    
    
    /**
     日期值
     
     - parameter formatterStyle: 格式化风格 如： yyyy-MM-dd HH:mm:ss
     
     - returns: NSDate 
     */
    public func dateValue(formatterStyle: String) -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "zh_CN")
        formatter.dateFormat = formatterStyle
        return formatter.dateFromString(self)
    }
    
    
    /// 汉字转拼音
    ///
    /// - Returns: 拼音
    public func pinyin() -> String? {
        //转成了可变字符串
        let str = NSMutableString(string: self)
        //先转换为带声调的拼音
        CFStringTransform(str as CFMutableStringRef, nil, kCFStringTransformMandarinLatin, false)
        //再转换为不带声调的拼音
        CFStringTransform(str as CFMutableStringRef, nil, kCFStringTransformStripDiacritics, false);
        return str.lowercaseString;
    }
    
    
}
