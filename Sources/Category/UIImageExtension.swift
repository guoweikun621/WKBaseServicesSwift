//
//  UIImageCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/27.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

extension UIImage {
    
    /**
     用颜色创建UIImage 大小：1x1
     
     - parameter color: 颜色
     
     - returns: UIImage
     */
    public static func image(color: UIColor) -> UIImage {
        return UIImage.image(color: color, size: CGSize(width: 1.0, height: 1.0))
    }
    
    /**
     用颜色创建UIImage
     
     - parameter color: 颜色
     - parameter size:  size
     
     - returns: UIImage
     */
    public static func image(color: UIColor, size: CGSize) -> UIImage {
        let f = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        UIGraphicsBeginImageContext(size)
        let content = UIGraphicsGetCurrentContext()
        content!.setFillColor(color.cgColor)
        content!.fill(f)
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
