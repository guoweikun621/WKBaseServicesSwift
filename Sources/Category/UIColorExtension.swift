//
//  UIColorCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/8/8.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

extension UIColor {

    public static func color(hexString: String, alpha: CGFloat = 1.0) -> UIColor! {
        var hex = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        hex = hex.lowercased()
        if hexString.hasPrefix("0x") {
            hex = (hex as NSString).substring(from: 2)
        }
        if hexString.hasPrefix("#") {
            hex = (hex as NSString).substring(from: 1)
        }
        if hex.count < 6 {
            return UIColor.black
        }
        
        let rStirng = (hex as NSString).substring(with: NSMakeRange(0, 2))
        let gString = (hex as NSString).substring(with: NSMakeRange(2, 2))
        let bString = (hex as NSString).substring(with: NSMakeRange(4, 2))
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner(string: rStirng).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
