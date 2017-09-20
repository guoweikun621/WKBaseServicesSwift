//
//  AppInfo.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/27.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit


open class App: NSObject {
    /**
     获取当前app版本号
     
     - returns: CFBundleVersion
     */
    public static func appVersion() -> String {
        let dict = Bundle.main.infoDictionary
        return (dict?["CFBundleVersion"])! as! String
    }
    
    
    /// 获取程序Caches目录
    public static var cachesDirectory: URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return paths.last!
    }
    
    
    /// 获取App Document路径
    public static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths.last!
    }
    
    /// 获取Library路径
    public static var libraryDirectory: URL {
        let paths = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
        return paths.last!
    }
    
    
    
}
