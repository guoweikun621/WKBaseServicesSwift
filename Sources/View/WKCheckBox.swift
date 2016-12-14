//
//  WKCheckBox.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/8/8.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

public enum BoxType {
    case Square
    case Circle
}

@IBDesignable
public class WKCheckBox: UIControl {
    
    @IBOutlet weak var delegate: WKCheckBoxDelegate?;
    var clickAction: ((_ box: WKCheckBox, _ on: Bool) -> Void)?
    
    /// 代理
    @IBOutlet public weak var delegate: WKCheckBoxDelegate?;
    
    /// 回调方式
    public var clickAction: ((_ box: WKCheckBox, _ on: Bool) -> Void)?
    
    
    /// 复选框类型   圆或方
    public var type: BoxType = .Square {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var offStrokeColor: UIColor = UIColor.color(hexString: "666666") {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var offFillColor: UIColor = UIColor.white {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    /// 选中时的线条颜色
    @IBInspectable public var onStrokeColor: UIColor = UIColor.white {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    
    /// 选中时的填充色
    @IBInspectable public var onFillColor: UIColor = UIColor.color(hexString: "00cc00") {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    
    /// 线条宽度
    @IBInspectable public var lineWidth: CGFloat = Device.scale() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    
    /// 是否选中
    @IBInspectable public var on: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.clear
        self.addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }
    
    @objc private func toggle(sender: AnyObject) {
        on = !on
        delegate?.click?(box: self, on: on)
        clickAction?(self, on)
    }
    
    private func updateUI() -> Void {

        let borderPath = type == .Square ? UIBezierPath(roundedRect: self.bounds, cornerRadius: 5) : UIBezierPath(ovalIn: self.bounds)
        borderPath.lineWidth = lineWidth;
        borderPath.lineCapStyle = .round
        borderPath.lineJoinStyle = .round
        borderPath.addClip()
        // 填充
        on ? onFillColor.set() : offFillColor.set()
        borderPath.fill()
        // 画边线
        on ? onFillColor.set() : offStrokeColor.set()
        borderPath.stroke()

        // 画对号
        on ? onStrokeColor.set() : offStrokeColor.set()
        if on {
            let checkBezier = UIBezierPath()
            checkBezier.move(to: CGPoint(x: self.width * 0.13, y: self.bounds.size.height * 0.45))
            checkBezier.addLine(to: CGPoint(x: self.bounds.size.width * 0.43, y: self.bounds.size.height * 0.73))
            checkBezier.addLine(to: CGPoint(x: self.bounds.size.width * 0.83, y: self.bounds.size.height * 0.3))
            checkBezier.lineWidth = lineWidth;
            checkBezier.lineJoinStyle = .round
            checkBezier.stroke()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect);
        
        self.updateUI()
    }
}


@objc public protocol WKCheckBoxDelegate {
    @objc optional func click(box: WKCheckBox, on: Bool)
}
