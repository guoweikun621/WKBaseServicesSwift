//
//  RegularEx.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2017/6/15.
//  Copyright © 2017年 郭伟坤. All rights reserved.
//

import UIKit

open class RegularExp: NSObject {
    
    
    public enum RegExp: String {
        case mobile = "1[34578][0-9]{9}"
        case phone = "^(\\d{3,4}-)\\d{7,8}$"
        case amount = "^[0-9]*?((\\.|,)[0-9]{0,2})?$"
        case mail = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        case idCard = "^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$"
    }

    
    /// 验证正则
    ///
    /// - Parameters:
    ///   - regular: 正则表达式
    ///   - value: 值
    /// - Returns: true or false
    public class func validate(regular: String, value: String?) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluate(with:value)
    }
    
    
    /// 验证正则 - 预设枚举
    ///
    /// - Parameters:
    ///   - regExp: 正则枚举类型
    ///   - value: 值
    /// - Returns: true or false
    public class func validate(regExp: RegExp, value: String?) -> Bool {
        return RegularExp.validate(regular: regExp.rawValue, value: value)
    }
    
    
    /// 判断是否为电话号码
    ///
    /// - Parameter value: 电话号码
    /// - Returns: 是否为电话号码
    public class func validateTelephone(value: String?) -> Bool {
        let m = RegularExp.validate(regExp: .mobile, value: value)
        let p = RegularExp.validate(regExp: .phone, value: value)
        return m || p
    }
    
    
    /// 验证是否为手机号
    ///
    /// - Parameter value: 手机号
    /// - Returns: 是否为手机号
    public class func validateMobile(value: String?) -> Bool {
        return RegularExp.validate(regExp: .mobile, value: value)
    }
    
    
    /// 验证是否为座机号
    ///
    /// - Parameter value: 座机
    /// - Returns: 是否为座机
    public class func validatePhone(value: String?) -> Bool {
        return RegularExp.validate(regExp: .phone, value: value)
    }
    
    
    
    
}
