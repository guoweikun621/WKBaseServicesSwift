//
//  UIAlertControllerQuickInitAndShow.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/18.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

extension UIAlertController: UIPopoverPresentationControllerDelegate {
    
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
        if cancelHandler != nil {
            self.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: cancelHandler))
        }
        if (confirmHandler != nil) {
            self.addAction(UIAlertAction(title: "确定", style: .Default, handler: confirmHandler))
        }
    }
    
    
    public convenience init(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, cancel: String?, destructive: String?, defaluts: [String]?, handler: ((UIAlertAction) -> Void)?) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        if cancel?.lenght > 0 {
            self.addAction(UIAlertAction(title: cancel, style: .Cancel, handler: handler))
        }
        if destructive?.lenght > 0 {
            self.addAction(UIAlertAction(title: destructive, style: .Destructive, handler: handler))
        }
        if let titles = defaluts {
            for actionTitle in titles {
                self.addAction(UIAlertAction(title: actionTitle, style: .Default, handler: handler))
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

public class WKAlertController {
    static var presentController: UIViewController? = {
        let appDelegate = UIApplication.sharedApplication().delegate! as UIApplicationDelegate
        if let window = appDelegate.window {
            let controller = window!.rootViewController
            if controller == nil {
                fatalError("初始化window.rootViewController")
            }
            return controller
        }
        
        return nil
    }()
    
    // MARK: - Alert
    public static func alert(message: String?) {
        WKAlertController.alert(message) { (alertAction) in
            
        }
    }
    
    public static func alert(message: String?, confirmHandler: ((UIAlertAction) -> Void)?) {
        WKAlertController.alert("提示", message: message, confirmHandler: confirmHandler)
    }
    
    public static func alert(title: String?, message: String?, confirmHandler: ((UIAlertAction) -> Void)?) {
        WKAlertController.alert(title, message: message, confirmHandler: confirmHandler, cancelHandler: nil)
    }
    
    public static func alert(title: String?, message: String?, confirmHandler: ((UIAlertAction) -> Void)?, cancelHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert, confirmHandler: confirmHandler, cancelHandler: cancelHandler)
        WKAlertController.presentController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: - ActionSheet
    
    public static func actionSheet(message: String?, defaluts: [String]?, handler: ((UIAlertAction) -> Void)?) {
        WKAlertController.actionSheet("提示", message: message, cancel: nil, defaluts: defaluts, handler: handler)
    }
    
    public static func actionSheet(title: String?, message: String?, defaluts: [String]?, handler: ((UIAlertAction) -> Void)?) {
        WKAlertController.actionSheet(title, message: message, cancel: nil, defaluts: defaluts, handler: handler)
    }
    
    public static func actionSheet(title: String?, message: String?, cancel: String?, defaluts: [String]?, handler: ((UIAlertAction) -> Void)?) {
        WKAlertController.actionSheet(title, message: message, cancel: cancel, destructive: nil, defaluts: defaluts, handler: handler)
    }
    
    public static func actionSheet(title: String?, message: String?, cancel: String?, destructive: String?, defaluts: [String]?, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet, cancel: cancel, destructive: destructive, defaluts: defaluts, handler: handler)
        WKAlertController.presentController?.presentViewController(alert, animated: true, completion: nil)
    }
}
