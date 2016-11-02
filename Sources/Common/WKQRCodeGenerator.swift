//
//  QRCodeGenerator.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2016/10/31.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

public class WKQRCodeGenerator: NSObject {
    
    
    /// 生成二维码
    ///
    /// - Parameters:
    ///   - content: 内容
    ///   - size: 大小
    ///   - logo: 中心块logo
    /// - Returns: 返回二维码图片
    public class func qrCode(content: String, size: CGSize, logo: UIImage? = nil) -> UIImage? {
        let contentData = content.dataUsingEncoding(NSUTF8StringEncoding)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setDefaults()
        filter?.setValue(contentData, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        let ci = filter?.outputImage
        return createQRCode(ci, size: size, logo: logo)
    }
    
    private class func createQRCode(img: CIImage?, size: CGSize, logo: UIImage? = nil) -> UIImage? {
        if img != nil {
            let rect = img!.extent
            let scale = min(size.width / rect.width, size.height / rect.height)
            let s = CGSize(width: rect.width * scale, height: rect.height * scale)
            let cs = CGColorSpaceCreateDeviceGray()
            let bitmapRef = CGBitmapContextCreate(nil, Int(s.width), Int(s.height), 8, 0, cs, 0)
            let context = CIContext(options: nil)
            let bitmapImage = context.createCGImage(img!, fromRect: rect)
            CGContextSetInterpolationQuality(bitmapRef!, .None)
            CGContextScaleCTM(bitmapRef!, scale, scale)
            CGContextDrawImage(bitmapRef!, rect, bitmapImage!)

            // save
            let scaledImage = CGBitmapContextCreateImage(bitmapRef!)
            
            let outputImage = UIImage(CGImage: scaledImage!)
            UIGraphicsBeginImageContextWithOptions(outputImage.size, false, Device.scale())
            outputImage.drawInRect(CGRect(origin: CGPointZero, size: size))

            if let waterImage = logo {
                waterImage.drawInRect(CGRect(origin: CGPoint(x: (size.width - waterImage.size.width) / 2.0, y: (size.height - waterImage.size.height) / 2.0), size: waterImage.size))
            }
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage
        }
        return nil
    }
    
}
