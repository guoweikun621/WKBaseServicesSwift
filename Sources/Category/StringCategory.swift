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
    
    /**
     日期值
     
     - parameter formatterStyle: 格式化风格 如： yyyy-MM-dd HH:mm:ss
     
     - returns: NSDate 
     */
    public func dateValue(formatterStyle: String) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.dateFormat = formatterStyle
        return formatter.date(from: self)
    }
    
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
