//
//  AppInfo.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/27.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

public class Device {
    
    /**
     获取iOS系统版本
     
     - returns: operatingSystemVersionString
     */
    public static func systemVersion() -> String {
        return NSProcessInfo.processInfo().operatingSystemVersionString
    }
    
    /**
     获取globallyUniqueString 设备唯一id
     
     - returns: globallyUniqueString
     */
    public static func uuid() -> String {
        return NSProcessInfo.processInfo().globallyUniqueString
    }
    
    /**
     获取设备名称
     
     - returns: 关于手机-手机名字
     */
    public static func deviceName() -> String {
        return NSProcessInfo.processInfo().hostName
    }
    
    /**
     设备屏幕每个点的像素数  scale
     
     - returns: scale
     */
    public static func scale() -> CGFloat {
        return UIScreen.mainScreen().scale
    }
    
    /**
     设备屏幕size
     
     - returns: CGSize
     */
    public static func size() -> CGSize {
        return UIScreen.mainScreen().bounds.size
    }
}


public class App {
    /**
     获取当前app版本号
     
     - returns: CFBundleVersion
     */
    public static func appVersion() -> String {
        let dict = NSBundle.mainBundle().infoDictionary
        print(dict?.description)
        return (dict?["CFBundleVersion"])! as! String
    }
    
    /**
     获取程序Caches目录
     
     - returns: Caches路径
     */
    public static func cachesDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
        return paths.first!
    }
    
    /**
     获取App Document路径
     
     - returns: Document 路径
     */
    public static func documentDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths.first!
    }
}