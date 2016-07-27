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


extension UIView {
    
    /// 视图的宽度
    public var width: CGFloat {
        get {
            return CGRectGetWidth(self.frame)
        }
    }
    
    /// 视图的高度
    public var height: CGFloat {
        get {
            return CGRectGetHeight(self.frame)
        }
    }
    
    /// 视图X坐标
    public var left: CGFloat {
        get {
            return CGRectGetMinX(self.frame)
        }
    }
    
    /// 视图最大X坐标
    public var right: CGFloat {
        get {
            return CGRectGetMaxX(self.frame)
        }
    }
    
    /// 视图 Y 坐标
    public var top: CGFloat {
        get {
            return CGRectGetMinY(self.frame)
        }
    }
    
    /// 视图最大Y坐标
    public var bottom: CGFloat {
        get { return CGRectGetMaxY(self.frame) }
    }
    
    private var lineHeight: CGFloat {
        get {
            return 1.0 / UIScreen.mainScreen().scale
        }
    }
    
    private enum Direction {
        case Leading
        case Tailing
        case Top
        case Bottom
    }
    
    private func addSeparatorLine(color: UIColor, leading: CGFloat, tailing: CGFloat, direction: Direction) -> UIView {
        let line = SeparatorLineView.init();
        var mask: UIViewAutoresizing
        var lineFrame: CGRect
        switch direction {
            case .Leading:
                lineFrame = CGRectMake(0, leading, lineHeight, height - leading - tailing)
                mask = .FlexibleRightMargin
            case .Tailing:
                lineFrame = CGRectMake(width - lineHeight, leading, lineHeight, height - leading - tailing)
                mask = .FlexibleLeftMargin
            case .Top:
                lineFrame = CGRectMake(leading, 0, width - leading - tailing, lineHeight)
                mask = .FlexibleBottomMargin
            case .Bottom:
                lineFrame = CGRectMake(leading, height - lineHeight, width - leading - tailing, lineHeight)
                mask = .FlexibleTopMargin
        }
        line.frame = lineFrame
        line.autoresizingMask = mask
        line.backgroundColor = color
        addSubview(line)
        return line
    }
    
    /**
     在视图左边线上加分隔线
     
     - parameter color:  分隔线颜色
     - parameter top:    距上边线的距离
     - parameter bottom: 距下边线的距离
     
     - returns: 分隔线
     */
    public func addLeftLine(color: UIColor, top: CGFloat, bottom: CGFloat) -> UIView {
        return self.addSeparatorLine(color, leading: top, tailing: bottom, direction: .Leading)
    }
    
    /**
     在视图右边线上加分隔线
     
     - parameter color:  分隔线颜色
     - parameter top:    距上边线的距离
     - parameter bottom: 距下边线的距离
     
     - returns: 分隔线
     */
    public func addRightLine(color: UIColor, top: CGFloat, bottom: CGFloat) -> UIView {
        return self.addSeparatorLine(color, leading: top, tailing: bottom, direction: .Tailing)
    }
    
    /**
     在视图上边线上加分隔线
     
     - parameter color:   分隔线颜色
     - parameter leading: 距左边线的距离
     - parameter tailing: 距右边线的距离
     
     - returns: 分隔线
     */
    public func addTopLine(color: UIColor, leading: CGFloat, tailing: CGFloat) -> UIView {
        return self.addSeparatorLine(color, leading: leading, tailing: tailing, direction: .Top)
    }
    
    /**
     在视图下边线上加分隔线
     
     - parameter color:   分隔线颜色
     - parameter leading: 距左边线的距离
     - parameter tailing: 距右边线的距离
     
     - returns: 分隔线
     */
    public func addBottomLine(color: UIColor, leading: CGFloat, tailing: CGFloat) -> UIView {
        return self.addSeparatorLine(color, leading: leading, tailing: tailing, direction: .Bottom)
    }
    
    public func clearSeparatorLine() {
        self.subviews.forEach { (obj) in
            if obj.isKindOfClass(SeparatorLineView) {
                if obj.width == lineHeight && (obj.left == 0.0 || obj.right == self.width) {
                    obj.removeFromSuperview();
                }
                if obj.height == lineHeight && (obj.top == 0.0 || obj.bottom == self.height) {
                    obj.removeFromSuperview();
                }
            }
        }
    }
}


class SeparatorLineView: UIView {
    
}
