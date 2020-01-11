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
