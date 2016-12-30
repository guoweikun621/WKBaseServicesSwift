//
//  NSLocalCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/27.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import Foundation

extension Locale {

    /**
     获取中国大陆Local
     
     - returns: NSLocal
     */
    public static func cnLocal() -> Locale {
        return Locale(identifier: "zh_CN")
    }
    
    /**
     获取RMB货币符号
     
     - returns: ¥
     */
    public static func cnCurrenySymbol() -> String? {
        return Locale.cnLocal().currencySymbol
    }
    
    
    /// 人民币Code
    ///
    /// - Returns: code
    public static func cnCurrenyCode() -> String? {
        return Locale.cnLocal().currencyCode
    }
}
