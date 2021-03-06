//
//  NSDecimalNumberCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/19.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

extension NSDecimalNumber {
    /**
     是否等于0
     
     - returns: true or false
     */
    public func isEqualZero() -> Bool {
        return compare(NSDecimalNumber.zero) == .orderedSame
    }
    
    /**
     是否小于0
     
     - returns: true or false
     */
    public func isLessThanZero() -> Bool {
        return compare(NSDecimalNumber.zero) == .orderedAscending
    }
    
    /**
     是否小于等于0
     
     - returns: true or false
     */
    public func isLessThanAndEqualZero() -> Bool {
        return compare(NSDecimalNumber.zero) != .orderedDescending
    }
    
    /**
     是否大于0
     
     - returns: true or false
     */
    public func isGreaterThanZero() -> Bool {
        return compare(NSDecimalNumber.zero) == .orderedDescending
    }
    
    /**
     是否大于等于0
     
     - returns: true or false
     */
    public func isGreaterThanAndEqualZero() -> Bool {
        return compare(NSDecimalNumber.zero) != .orderedAscending
    }
    
    /// 人民币格式化
    ///
    /// - Returns: ¥0.00
    public func currenyString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        numberFormatter.currencySymbol = Locale.current.currencySymbol
        numberFormatter.currencyCode = Locale.current.currencyCode
        
        return numberFormatter.string(from: self)!
    }
    
    
    /// rmb 格式字符串，带人民币符号¥
    ///
    /// - Returns: ¥0.00格式金额
    public func rmbString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.cnLocal()
        numberFormatter.currencySymbol = Locale.cnCurrenySymbol()
        numberFormatter.currencyCode = Locale.cnCurrenyCode()
        
        return numberFormatter.string(from: self)!
    }
}
