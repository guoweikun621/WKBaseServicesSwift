//
//  WKPlaceholderTextView.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2016/11/30.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

@IBDesignable
open class WKPlaceholderTextView: UITextView {
    

    
    private var placeholderLabel: UILabel!
    
    
    /// 最大字数
    @IBInspectable open var maxTextCount: Int = Int.max
    
    
    /// 最大可输入字数
    open var canInputMaxCount: Int = Int.max
    
    
    /// 可输入字数回调闭包
    public var textChangedClosure: ((_ textView: UITextView, _ canInputCount: Int) -> Void)?
    
    /// 占位符
    @IBInspectable open var placeholder: String? {
        set {
            placeholderLabel.text = newValue
        }
        get {
            return placeholderLabel.text
        }
    }
    
    
    /// 占位符颜色
    @IBInspectable open var placeholderColor: UIColor? {
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
        
        self.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel = UILabel(frame: CGRect.zero)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.color(hexString: "cccccc")
        placeholderLabel.textAlignment = self.textAlignment
        placeholderLabel.clipsToBounds = false
        
        addSubview(placeholderLabel)
                
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
        
        setNeedsUpdateConstraints()
    }

    func textChanged(notification: NSNotification) {
        placeholderLabel.isHidden = self.text.lenght > 0
        
        let toBeString = self.text ?? ""
        
        // 输入语言
        let lang = self.textInputMode?.primaryLanguage
        var len = maxTextCount - toBeString.lenght
        
        if lang == "zh-Hans" { // 简体中文
            // 获取高亮部分
            var position: UITextPosition? = nil
            if let selectedRange = self.markedTextRange {
                position = self.position(from: selectedRange.start, offset: 0)
            }
            
            if position == nil { // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
                if len < 0 {
                    len = 0
                    let idx = toBeString.index(toBeString.startIndex, offsetBy: maxTextCount)
                    self.text = toBeString.substring(to: idx)
                }
            }
        }
        else {
            if len < 0 {
                len = 0
                let idx = toBeString.index(toBeString.startIndex, offsetBy: maxTextCount)
                text = toBeString.substring(to: idx)
            }
        }
        canInputMaxCount = max(0, len)
        textChangedClosure?(self, canInputMaxCount)
    }
    
    open override func updateConstraints() {
        
        self.contentOffset = CGPoint.zero
        self.contentInset = UIEdgeInsets.zero
        
        let container = self.textContainer
        
        var constrants = [NSLayoutConstraint]()
        constrants.append(NSLayoutConstraint(item: placeholderLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: container.lineFragmentPadding))
        constrants.append(NSLayoutConstraint(item: placeholderLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -container.lineFragmentPadding))
        constrants.append(NSLayoutConstraint(item: placeholderLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 8))
        constrants.append(NSLayoutConstraint(item: placeholderLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -8))
        
        constrants.append(NSLayoutConstraint(item: placeholderLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: self.width - container.lineFragmentPadding * 2))
        
        addConstraints(constrants)
        
        super.updateConstraints()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


