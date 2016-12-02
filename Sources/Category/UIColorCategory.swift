//
//  UIColorCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/8/8.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

extension UIColor {
    
    public static func color(hexString: String) -> UIColor! {
        return UIColor.color(hexString, alpha: 1.0)
    }
    
    public static func color(hexString: String, alpha: CGFloat) -> UIColor! {
        var hex = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        hex = hex.lowercaseString
        if hexString.hasPrefix("0x") {
            hex = (hex as NSString).substringFromIndex(2)
        }
        if hexString.hasPrefix("#") {
            hex = (hex as NSString).substringFromIndex(1)
        }
        if hex.characters.count < 6 {
            return UIColor.blackColor()
        }
        
        let rStirng = (hex as NSString).substringWithRange(NSMakeRange(0, 2))
        let gString = (hex as NSString).substringWithRange(NSMakeRange(2, 2))
        let bString = (hex as NSString).substringWithRange(NSMakeRange(4, 2))
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        NSScanner(string: rStirng).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
