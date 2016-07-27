//
//  AppInfo.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/27.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import Foundation

public class DeviceInfo {
    
    public static func systemVersion() -> String {
        return NSProcessInfo.processInfo().operatingSystemVersionString
    }
    
    public static func uuid() -> String {
        return NSProcessInfo.processInfo().globallyUniqueString
    }
    
    public static func deviceName() -> String {
        return NSProcessInfo.processInfo().hostName
    }
}


public class AppInfo {
    public static func appVersion() -> String {
        let dict = NSBundle.mainBundle().infoDictionary
        print(dict?.description)
        return (dict?["CFBundleVersion"])! as! String
    }
}