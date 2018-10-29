//
//  UIAlertControllerQuickInitAndShow.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/18.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

extension UIAlertController: UIPopoverPresentationControllerDelegate {
    
    #if swift(>=4.2)
    public typealias WKPreferredStyle = UIAlertController.Style
    #else
    public typealias WKPreferredStyle = UIAlertControllerStyle
    #endif
    /**
     便利构造器
     
     - parameter title:          提示标题
     - parameter message:        提示信息
     - parameter confirmHandler: 确定事件
     - parameter cancelHandler:  取消事件
     
     - returns: UIAlertController
     */
    public convenience init(title: String?, message: String?, preferredStyle: WKPreferredStyle, confirmHandler: ((UIAlertAction) -> Void)?, cancelHandler: ((UIAlertAction) -> Void)?) {
        self.init(title: title, message: message, preferredStyle: preferredStyle);
        if cancelHandler != nil {
            self.addAction(UIAlertAction(title: "取消", style: .cancel, handler: cancelHandler))
        }
        if (confirmHandler != nil) {
            self.addAction(UIAlertAction(title: "确定", style: .default, handler: confirmHandler))
        }
    }

    /// 便利构造器
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 消息
    ///   - preferredStyle: 类型 alert or actionsheet
    ///   - cancel: 取消按钮
    ///   - destructive: 强效
    ///   - defaluts: 默认按钮数组
    ///   - handler: 按钮回调方法
    public convenience init(title: String?, message: String?, preferredStyle: WKPreferredStyle, cancel: String?, destructive: String?, defaluts: [String]?, handler: ((UIAlertAction) -> Void)?) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        if (cancel != nil) && (cancel?.count)! > 0 {
            self.addAction(UIAlertAction(title: cancel, style: .cancel, handler: handler))
        }
        if (destructive != nil) && (destructive?.count)! > 0 {
            self.addAction(UIAlertAction(title: destructive, style: .destructive, handler: handler))
        }
        if let titles = defaluts {
            for actionTitle in titles {
                self.addAction(UIAlertAction(title: actionTitle, style: .default, handler: handler))
            }
        }
    }
    
    /**
     便利构造器 Alert
     
     - parameter message:        提示信息
     - parameter confirmHandler: 确定事件
     - parameter cancelHandler:  取消事件
     
     - returns: UIAlertController
     */
    public convenience init(message: String?, preferredStyle: WKPreferredStyle, confirmHandler: ((UIAlertAction) -> Void)?, cancelHandler: ((UIAlertAction) -> Void)?) {
        self.init(title: "提示", message: message, preferredStyle: preferredStyle, confirmHandler: confirmHandler, cancelHandler: cancelHandler);
    }
    
    /**
     无事件响应的构造器 Alert
     
     - parameter message: 提示信息
     
     - returns: UIAlertController
     */
    public convenience init(message: String?, preferredStyle: WKPreferredStyle) {
        self.init(title: "提示", message: message, preferredStyle: preferredStyle);
        self.addAction(UIAlertAction.init(title: "确定", style: .default, handler: nil));
    }
}

extension UIAlertController {
    #if swift(>=4.2)
    open func addAction(title: String?, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)? = nil) {
        addAction(UIAlertAction(title: title, style: style, handler: handler))
    }
    #else
    open func addAction(title: String?, style: UIAlertActionStyle = .default, handler: ((UIAlertAction) -> Void)? = nil) {
        addAction(UIAlertAction(title: title, style: style, handler: handler))
    }
    #endif
}
