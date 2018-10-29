//
//  Device.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2017/9/20.
//  Copyright © 2017年 郭伟坤. All rights reserved.
//

import UIKit

open class Device: NSObject {
    
    public static let `default` = Device()
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

    
    /// 判断是否是 iPhone Xx
    ///
    /// - Returns: bool
    public func iPhoneXSeries() -> Bool {
        var iPhoneXSer = false
        if UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.phone {
            return iPhoneXSer
        }
        
        let mainWindow = UIApplication.shared.delegate?.window
        guard let window = mainWindow else {
            return iPhoneXSer
        }
        if #available(iOS 11.0, *) {
            if window!.safeAreaInsets.bottom > CGFloat(0.0) {
                iPhoneXSer = true
            }
        }
        
        return iPhoneXSer
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
}

extension Device {
    // MARK: - Deprecated
    
    
    /// 设备类型
    ///
    /// - iPhone4s: iPhone4，iPhone4s
    /// - iPhone5E: iPhone5，iPhone5s，iPhone5E
    /// - iPhone6: iPhone6，iPhone7，iPhone8
    /// - iPhone6Plus: iPhone6Plus，7Plus，8Plus
    /// - iPhoneX: iPhone X
    @available(*, deprecated, message: "此enum已过时")
    public enum DeviceType: String {
        case iPhone4s
        case iPhone5E
        case iPhone6
        case iPhone6Plus
        case iPhoneX
    }
    
    
    /// 返回设备类型枚举 enum DeviceType
    ///
    /// - Returns: 具体设备类型
    @available(*, deprecated, message: "此方法已过时")
    public class func currentDeviceType() -> DeviceType {
        let size = (UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        switch size {
        case (320, 480), (480, 320):
            return .iPhone4s
        case (320, 568), (568, 320):
            return .iPhone5E
        case (375, 667), (667, 375):
            return .iPhone6
        case (414, 736), (736, 414):
            return .iPhone6Plus
        case (375, 812), (812, 375):
            return .iPhoneX
        default:
            return .iPhone6
        }
    }
    
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
    
    /// 判断是否 iPhone5 尺寸设备
    ///
    /// - Returns: Bool
    @available(*, deprecated, message: "请使用： public class func currentDeviceType() -> DeviceType")
    public static func isPhone5() -> Bool {
        return size().height == 568
    }
    
    
    /// 判断是否 iPhone4 尺寸设备
    ///
    /// - Returns: Bool
    @available(*, deprecated, message: "请使用： public class func currentDeviceType() -> DeviceType")
    public static func isPhone4() -> Bool {
        return size().height == 480
    }
    
    
    /// 判断是否 iPhone6 尺寸设备
    ///
    /// - Returns: Bool
    @available(*, deprecated, message: "请使用： public class func currentDeviceType() -> DeviceType")
    public static func isPhone6() -> Bool {
        return size().height == 667
    }
    
    
    /// 判断是否 iPhone plus 尺寸设备
    ///
    /// - Returns: Bool
    @available(*, deprecated, message: "请使用： public class func currentDeviceType() -> DeviceType")
    public static func isPhonePlus() -> Bool {
        return size().height == 736
    }
    
    
    /// 判断是否是 iPhone X 设备
    ///
    /// - Returns: Bool
    @available(*, deprecated, message: "请使用： public class func currentDeviceType() -> DeviceType")
    public static func isPhoneX() -> Bool {
        return size().height == 812.0
    }
}
