//
//  UINavigationBarEx.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2017/7/31.
//  Copyright © 2017年 郭伟坤. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    
    /// 设置导航栏背景色
    ///
    /// - Parameter color: 颜色
    func setBgColor(_ color: UIColor) {
        let view = UIView()
        view.backgroundColor = color
        setValue(view, forKey: "backgroundView")
    }
    
    
    /// 恢复导航栏默认背景色
    func setDefalutBgColor() {
        setValue(nil, forKey: "backgroundView")
    }
}
