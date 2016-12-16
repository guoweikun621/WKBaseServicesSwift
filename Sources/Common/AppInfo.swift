//
//  AppInfo.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/27.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

open class Device {
    
    /**
     获取iOS系统版本
     
     - returns: operatingSystemVersionString
     */
    public static func systemVersion() -> String {
        return ProcessInfo.processInfo.operatingSystemVersionString
    }
    
    /**
     获取globallyUniqueString 设备唯一id
     
     - returns: globallyUniqueString
     */
    public static func uuid() -> String {
        return ProcessInfo.processInfo.globallyUniqueString
    }
    
    /**
     获取设备名称
     
     - returns: 关于手机-手机名字
     */
    public static func deviceName() -> String {
        return ProcessInfo.processInfo.hostName
    }
    
    /**
     设备屏幕每个点的像素数  scale
     
     - returns: scale
     */
    public static func scale() -> CGFloat {
        return UIScreen.main.scale
    }
    
    /**
     设备屏幕size
     
     - returns: CGSize
     */
    public static func size() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    
    /// 判断是否 iPhone5 尺寸设备
    ///
    /// - Returns: Bool
    public static func isPhone5() -> Bool {
        return size().height == 568
    }
    
    
    /// 判断是否 iPhone4 尺寸设备
    ///
    /// - Returns: Bool
    public static func isPhone4() -> Bool {
        return size().height == 480
    }
    
    
    /// 判断是否 iPhone6 尺寸设备
    ///
    /// - Returns: Bool
    public static func isPhone6() -> Bool {
        return size().height == 667
    }
    
    
    /// 判断是否 iPhone plus 尺寸设备
    ///
    /// - Returns: Bool
    public static func isPhonePlus() -> Bool {
        return size().height == 736
    }
}


open class App {
    /**
     获取当前app版本号
     
     - returns: CFBundleVersion
     */
    public static func appVersion() -> String {
        let dict = Bundle.main.infoDictionary
        return (dict?["CFBundleVersion"])! as! String
    }
    
    /**
     获取程序Caches目录
     
     - returns: Caches路径
     */
    public static func cachesDirectory() -> String {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return (paths.last?.absoluteString)!
    }
    
    /**
     获取App Document路径
     
     - returns: Document 路径
     */
    public static func documentDirectory() -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return (paths.last?.absoluteString)!
    }
    
    /**
     获取Library路径
     
     - returns: Library路径
     */
    public static func libraryDirectory() -> String? {
        let paths = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
        return paths.last?.absoluteString
    }
    
    
    
}
