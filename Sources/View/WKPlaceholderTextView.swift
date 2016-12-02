//
//  WKPlaceholderTextView.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2016/11/30.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

@IBDesignable
public class WKPlaceholderTextView: UITextView {
    
    
    private var placeholderLabel: UILabel!
    
    
    /// 占位符
    @IBInspectable public var placeholder: String? {
        set {
            placeholderLabel.text = newValue
        }
        get {
            return placeholderLabel.text
        }
    }
    
    
    /// 占位符颜色
    @IBInspectable public var placeholderColor: UIColor? {
        set {
            placeholderLabel.textColor = newValue
        }
        get {
            return placeholderLabel.textColor
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        let inset = self.textContainerInset
        
        placeholderLabel = UILabel(frame: CGRect(origin: CGPoint(x: inset.left+2, y: inset.top), size: CGSize(width: self.width - 20, height: 20)))
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.color("cccccc")
        addSubview(placeholderLabel)
                
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(textChanged), name: UITextViewTextDidChangeNotification, object: nil)
    }

    func textChanged(notification: NSNotification) {
        placeholderLabel.hidden = self.text.lenght > 0
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidChangeNotification, object: nil)
    }
    
}
