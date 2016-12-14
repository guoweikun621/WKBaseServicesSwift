//
//  NSLocalCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/27.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import Foundation

extension NSLocale {

    /**
     获取中国大陆Local
     
     - returns: NSLocal
     */
    public static func cnLocal() -> NSLocale {
        return NSLocale(localeIdentifier: "zh_CN")
    }
    
    /**
     获取RMB货币符号
     
     - returns: ¥
     */
    public static func cnCurrenySymbol() -> String? {
        return NSLocale.cnLocal().object(forKey: .currencySymbol) as? String
    }
    
    
    /// 人民币Code
    ///
    /// - Returns: code
    public static func cnCurrenyCode() -> String? {
        return NSLocale.cnLocal().object(forKey: .currencyCode) as? String
    }
}
