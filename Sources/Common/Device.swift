//
//  Device.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2017/9/20.
//  Copyright © 2017年 郭伟坤. All rights reserved.
//

import UIKit

open class Device: NSObject {
    
    
    /// 当前系统版本
    public static var operatingSystemVersion: OperatingSystemVersion {
        return ProcessInfo.processInfo.operatingSystemVersion
    }
    
    
    /// 设备uuid globallyUniqueString
    public static var uuid: String {
        return ProcessInfo.processInfo.globallyUniqueString
    }
    
    
    /// 获取设备名称, 关于手机-手机名字
    public static var iPhoneName: String {
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
    
    
    /// 判断是否是 iPhone X 设备
    ///
    /// - Returns: Bool
    public static func isPhoneX() -> Bool {
        return size().height == 812.0
    }
}

extension Device {
    // MARK: - Deprecated
    
    /**
     获取iOS系统版本
     
     - returns: operatingSystemVersionString
     */
    @available(*, deprecated, message: "请使用 var operatingSystemVersion: OperatingSystemVersion 属性")
    public static func systemVersion() -> String {
        return ProcessInfo.processInfo.operatingSystemVersionString
    }
    
    /**
     获取设备名称
     
     - returns: 关于手机-手机名字
     */
    @available(*, deprecated, message: "请使用 var deviceName: String 属性")
    public static func deviceName() -> String {
        return ProcessInfo.processInfo.hostName
    }
}
