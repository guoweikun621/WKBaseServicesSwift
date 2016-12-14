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
        let contentData = content.data(using: String.Encoding.utf8)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setDefaults()
        filter?.setValue(contentData, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        let ci = filter?.outputImage
        return createQRCode(img: ci, size: size, logo: logo)
    }
    
    private class func createQRCode(img: CIImage?, size: CGSize, logo: UIImage? = nil) -> UIImage? {
        if img != nil {
            let rect = img!.extent
            let scale = min(size.width / rect.width, size.height / rect.height)
            let s = CGSize(width: rect.width * scale, height: rect.height * scale)
            let cs = CGColorSpaceCreateDeviceGray()
            let bitmapRef = CGContext(data: nil, width: Int(s.width), height: Int(s.height), bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: 0)
            let context = CIContext(options: nil)
            let bitmapImage = context.createCGImage(img!, from: rect)
            bitmapRef!.interpolationQuality = .none
            bitmapRef!.scaleBy(x: scale, y: scale)
            // CGContextDrawImage(bitmapRef!, rect, bitmapImage!)
            bitmapRef?.draw(bitmapImage!, in: rect)
            
            // save
            let scaledImage = bitmapRef!.makeImage()
            
            let outputImage = UIImage(cgImage: scaledImage!)
            UIGraphicsBeginImageContextWithOptions(outputImage.size, false, Device.scale())
            outputImage.draw(in: CGRect(origin: CGPoint.zero, size: size))

            if let waterImage = logo {
                waterImage.draw(in: CGRect(origin: CGPoint(x: (size.width - waterImage.size.width) / 2.0, y: (size.height - waterImage.size.height) / 2.0), size: waterImage.size))
            }
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage
        }
        return nil
    }
    
}
