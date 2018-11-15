//
//  UIViewCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/19.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

public extension UIView {
    
    
    /// 给UIView及其子类添加分隔线
    ///
    /// - Parameters:
    ///   - directions: 分隔线方向
    ///   - configClosure: 分隔线的配置
    public func addSeparatorLines(_ directions: [SeparatorView.SeparatorDirection], configClosure: SeparatorView.SeparatorConfigClosure? = nil) {
        directions.forEach {
            addSeparator($0, configClosure: configClosure)
        }
    }
    
    fileprivate func addSeparator(_ direction: SeparatorView.SeparatorDirection, configClosure: SeparatorView.SeparatorConfigClosure?) {
        let lineView = SeparatorView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        configClosure?(lineView, direction)
        lineView.backgroundColor = lineView.defaultConfig.color
        lineView.direct = direction
        addSubview(lineView)
        switch direction {
        case .left:
            lineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            lineView.widthAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
            lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            break
        case .right:
            lineView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            lineView.widthAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
            lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            break
        case .top:
            lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
            lineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
            lineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            break
        case .bottom:
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
            lineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
            lineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            break
        case .centerX:
            lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            lineView.widthAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
            lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            break
        case .centerY:
            lineView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
            lineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
            lineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            break
        default:
            break
        }
    }
    
    
    /// 移除所有分隔线
    public func removeAllSeparatorLine() {
        subviews.compactMap { $0 as? SeparatorView }
            .forEach { $0.removeFromSuperview() }
    }
    
    /// 移除分隔线
    ///
    /// - Parameter directions: 被移除分隔线的方向
    public func removeSeparatorLine(_ directions: [SeparatorView.SeparatorDirection]) {
        let directSet = Set(directions)
        subviews.compactMap { $0 as? SeparatorView }
            .filter { directSet.contains($0.direct) }
            .forEach { $0.removeFromSuperview() }
    }
}



public final class SeparatorView: UIView {
    public typealias SeparatorConfigClosure = (SeparatorView, SeparatorView.SeparatorDirection) -> Void
    
    public struct SeparatorInsets {
        public var frond: CGFloat
        public var back: CGFloat
        
        public static func zero() -> SeparatorView.SeparatorInsets {
            return SeparatorInsets(frond: 0, back: 0)
        }
    }
    
    public struct SeparatorConfig {
        public var insets: SeparatorInsets = .zero()
        public var color: UIColor = .groupTableViewBackground
        public var height: CGFloat = 1.0
    }
    
    
    /// 分隔线配置
    public var defaultConfig: SeparatorConfig = SeparatorConfig()
    
    
    /// 分隔线方向
    ///
    /// - none: 不添加分隔线
    /// - left: 左
    /// - right: 右
    /// - top: 上
    /// - bottom: 下
    /// - centerX: 水平中间
    /// - centerY: 垂直中间
    public enum SeparatorDirection {
        case none
        case left
        case right
        case top
        case bottom
        case centerX
        case centerY
    }
    
    fileprivate var direct: SeparatorDirection = .none
}



extension UIView {
    
    /// layer 圆角半径
    @available(iOS, deprecated, message: "属性已废弃")
    @IBInspectable public var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    /// layer borderWidth
    @available(iOS, deprecated, message: "属性已废弃")
    @IBInspectable public var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    /// layer border Color
    @available(iOS, deprecated, message: "属性已废弃")
    @IBInspectable public var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
    }
    @available(iOS, deprecated, message: "属性已废弃")
    public var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    @available(iOS, deprecated, message: "属性已废弃")
    public var size: CGSize {
        get { return self.frame.size }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    /// 视图的宽度
    @available(iOS, deprecated, message: "属性已废弃")
    public var width: CGFloat {
        get {
            return self.frame.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    /// 视图的高度
    @available(iOS, deprecated, message: "属性已废弃")
    public var height: CGFloat {
        get {
            return self.frame.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    /// 视图X坐标
    @available(iOS, deprecated, message: "属性已废弃")
    public var left: CGFloat {
        get {
            return self.frame.minX
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    /// 视图最大X坐标
    @available(iOS, deprecated, message: "属性已废弃")
    public var right: CGFloat {
        get {
            return self.frame.maxX
        }
        set {
            var frame = self.frame
            frame.size.width = (newValue - frame.origin.x)
            self.frame = frame
        }
    }
    
    /// 视图 Y 坐标
    @available(iOS, deprecated, message: "属性已废弃")
    public var top: CGFloat {
        get {
            return self.frame.minY
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    /// 视图最大Y坐标
    @available(iOS, deprecated, message: "属性已废弃")
    public var bottom: CGFloat {
        get { return self.frame.maxY }
        set {
            var frame = self.frame
            frame.size.height = (newValue - frame.origin.y)
            self.frame = frame
        }
    }
    
    
    /// Center.x
    @available(iOS, deprecated, message: "属性已废弃")
    public var centerX: CGFloat {
        get { return self.center.x }
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    
    /// Center.y
    @available(iOS, deprecated, message: "属性已废弃")
    public var centerY: CGFloat {
        get { return self.center.y }
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    /// 分隔线宽度或高度
    @available(iOS, deprecated, message: "属性已废弃")
    private var lineHeight: CGFloat {
        get {
            return 1.0 / UIScreen.main.scale
        }
    }
    
    /**
     分隔线的方向
     
     - Leading: 左
     - Trailing: 右
     - Top:     上
     - Bottom:  下
     */
    @available(iOS, deprecated, message: "属性已废弃")
    public enum Direction {
        case Leading
        case Trailing
        case Top
        case Bottom
    }
    
    @discardableResult
    private func addSeparatorLine(color: UIColor, leading: CGFloat, trailing: CGFloat, direction: Direction) -> UIView {
        let line = SeparatorView();
        
        line.backgroundColor = color
        addSubview(line)
        
        line.translatesAutoresizingMaskIntoConstraints = false
        switch direction {
        case .Leading:
            self.addConstraints([
                NSLayoutConstraint(item: line, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: line, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: leading),
                NSLayoutConstraint(item: line, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -trailing),
                NSLayoutConstraint(item: line, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: lineHeight)])
            
            break
            
        case .Trailing:
            self.addConstraints([
                NSLayoutConstraint(item: line, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: line, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: leading),
                NSLayoutConstraint(item: line, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -trailing),
                NSLayoutConstraint(item: line, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: lineHeight)])
        case .Top:
            self.addConstraints([
                NSLayoutConstraint(item: line, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: line, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: leading),
                NSLayoutConstraint(item: line, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -trailing),
                NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: lineHeight)])
        case .Bottom:
            self.addConstraints([
                NSLayoutConstraint(item: line, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: line, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: leading),
                NSLayoutConstraint(item: line, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -trailing),
                NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: lineHeight)])
        }
        
        return line
    }
    
    /**
     在视图左边线上加分隔线
     
     - parameter color:  分隔线颜色
     
     - returns: 分隔线
     */
    @discardableResult
    @available(iOS, deprecated, message: "方法已废弃，请使用：addSeparatorLines(_ directions: [SeparatorView.SeparatorDirection], configClosure: SeparatorView.SeparatorConfigClosure?)")
    public func addLeftLine(color: UIColor) -> UIView {
        return self.addLeftLine(color: color, top: 0.0, bottom: 0.0)
    }
    
    /**
     在视图左边线上加分隔线
     
     - parameter color:  分隔线颜色
     - parameter top:    距上边线的距离
     - parameter bottom: 距下边线的距离
     
     - returns: 分隔线
     */
    @discardableResult
    @available(iOS, deprecated, message: "方法已废弃，请使用：addSeparatorLines(_ directions: [SeparatorView.SeparatorDirection], configClosure: SeparatorView.SeparatorConfigClosure?)")
    public func addLeftLine(color: UIColor, top: CGFloat, bottom: CGFloat) -> UIView {
        return self.addSeparatorLine(color: color, leading: top, trailing: bottom, direction: .Leading)
    }
    
    
    /**
     在视图右边线上加分隔线
     
     - parameter color:  分隔线颜色
     
     - returns: 分隔线
     */
    @discardableResult
    @available(iOS, deprecated, message: "方法已废弃，请使用：addSeparatorLines(_ directions: [SeparatorView.SeparatorDirection], configClosure: SeparatorView.SeparatorConfigClosure?)")
    public func addRightLine(color: UIColor) -> UIView {
        return self.addRightLine(color: color, top: 0.0, bottom: 0.0)
    }
    
    /**
     在视图右边线上加分隔线
     
     - parameter color:  分隔线颜色
     - parameter top:    距上边线的距离
     - parameter bottom: 距下边线的距离
     
     - returns: 分隔线
     */
    @discardableResult
    @available(iOS, deprecated, message: "方法已废弃，请使用：addSeparatorLines(_ directions: [SeparatorView.SeparatorDirection], configClosure: SeparatorView.SeparatorConfigClosure?)")
    public func addRightLine(color: UIColor, top: CGFloat, bottom: CGFloat) -> UIView {
        return self.addSeparatorLine(color: color, leading: top, trailing: bottom, direction: .Trailing)
    }
    
    
    /**
     在视图上边线上加分隔线
     
     - parameter color:   分隔线颜色
     
     - returns: 分隔线
     */
    @discardableResult
    @available(iOS, deprecated, message: "方法已废弃，请使用：addSeparatorLines(_ directions: [SeparatorView.SeparatorDirection], configClosure: SeparatorView.SeparatorConfigClosure?)")
    public func addTopLine(color: UIColor) -> UIView {
        return self.addTopLine(color: color, leading: 0.0, trailing: 0.0)
    }
    
    /**
     在视图上边线上加分隔线
     
     - parameter color:   分隔线颜色
     - parameter leading: 距左边线的距离
     - parameter trailing: 距右边线的距离
     
     - returns: 分隔线
     */
    @discardableResult
    @available(iOS, deprecated, message: "方法已废弃，请使用：addSeparatorLines(_ directions: [SeparatorView.SeparatorDirection], configClosure: SeparatorView.SeparatorConfigClosure?)")
    public func addTopLine(color: UIColor, leading: CGFloat, trailing: CGFloat) -> UIView {
        return self.addSeparatorLine(color: color, leading: leading, trailing: trailing, direction: .Top)
    }
    
    /**
     在视图下边线上加分隔线
     
     - parameter color:   分隔线颜色
     
     - returns: 分隔线
     */
    @discardableResult
    @available(iOS, deprecated, message: "方法已废弃，请使用：addSeparatorLines(_ directions: [SeparatorView.SeparatorDirection], configClosure: SeparatorView.SeparatorConfigClosure?)")
    public func addBottomLine(color: UIColor) -> UIView {
        return self.addBottomLine(color: color, leading: 0.0, trailing: 0.0)
    }
    
    /**
     在视图下边线上加分隔线
     
     - parameter color:   分隔线颜色
     - parameter leading: 距左边线的距离
     - parameter trailing: 距右边线的距离
     
     - returns: 分隔线
     */
    @discardableResult
    @available(iOS, deprecated, message: "方法已废弃，请使用：addSeparatorLines(_ directions: [SeparatorView.SeparatorDirection], configClosure: SeparatorView.SeparatorConfigClosure?)")
    public func addBottomLine(color: UIColor, leading: CGFloat, trailing: CGFloat) -> UIView {
        return self.addSeparatorLine(color: color, leading: leading, trailing: trailing, direction: .Bottom)
    }
    
    
    /**
     清除自定义分隔线
     */
    @available(iOS, deprecated, message: "方法已废弃，请使用：removeAllSeparatorLine()")
    public func clearSeparatorLine() {
        self.subviews.forEach { (obj) in
            if obj.isKind(of: SeparatorView.self) {
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
