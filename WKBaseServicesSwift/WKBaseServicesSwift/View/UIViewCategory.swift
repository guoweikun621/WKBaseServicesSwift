//
//  UIViewCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/19.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

@IBDesignable
class UIViewCategory: UIView {

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth;
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.layer.borderColor = borderColor.CGColor;
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius;
        }
    }
}
