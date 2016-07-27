//
//  UIImageCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/27.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

extension UIImage {
    
    public static func image(color: UIColor) -> UIImage {
        return UIImage.image(color, size: CGSizeMake(1.0, 1.0))
    }
    
    public static func image(color: UIColor, size: CGSize) -> UIImage {
        let f = CGRect.init(origin: CGPointZero, size: size)
        UIGraphicsBeginImageContext(size)
        let content = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(content, color.CGColor)
        CGContextFillRect(content, f)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}