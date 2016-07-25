//
//  UIAlertControllerQuickInitAndShow.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/18.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    /**
     便利构造器
     
     - parameter title:          提示标题
     - parameter message:        提示信息
     - parameter confirmHandler: 确定事件
     - parameter cancelHandler:  取消事件
     
     - returns: UIAlertController
     */
    public convenience init(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, confirmHandler: ((UIAlertAction) -> Void)?, cancelHandler: ((UIAlertAction) -> Void)?) {
        self.init(title: title, message: message, preferredStyle: preferredStyle);
        self.addAction(UIAlertAction.init(title: "取消", style: .Cancel, handler: cancelHandler));
        self.addAction(UIAlertAction.init(title: "确定", style: .Default, handler: confirmHandler));
    }
    
    /**
     便利构造器 Alert
     
     - parameter message:        提示信息
     - parameter confirmHandler: 确定事件
     - parameter cancelHandler:  取消事件
     
     - returns: UIAlertController
     */
    public convenience init(message: String?, preferredStyle: UIAlertControllerStyle, confirmHandler: ((UIAlertAction) -> Void)?, cancelHandler: ((UIAlertAction) -> Void)?) {
        self.init(title: "提示", message: message, preferredStyle: preferredStyle, confirmHandler: confirmHandler, cancelHandler: cancelHandler);
    }
    
    /**
     无事件响应的构造器 Alert
     
     - parameter message: 提示信息
     
     - returns: UIAlertController
     */
    public convenience init(message: String?, preferredStyle: UIAlertControllerStyle) {
        self.init(title: "提示", message: message, preferredStyle: preferredStyle);
        self.addAction(UIAlertAction.init(title: "确定", style: .Default, handler: nil));
    }
}