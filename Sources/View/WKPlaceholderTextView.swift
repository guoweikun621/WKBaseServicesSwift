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
    public var textChangedClosure: ((_ textView: WKPlaceholderTextView, _ canInputCount: Int) -> Void)?
    
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
        placeholderLabel.numberOfLines = 3
        
        addSubview(placeholderLabel)
        
        #if swift(>=4.2)
        let notificationName = UITextView.textDidChangeNotification
        #else
        let notificationName = NSNotification.Name.UITextViewTextDidChange
        #endif
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged(_:)), name: notificationName, object: nil)
        
        setNeedsUpdateConstraints()
    }

    @objc func textChanged(_ notification: NSNotification) {
        placeholderLabel.isHidden = self.text.count > 0
        
        let toBeString = self.text ?? ""
        
        // 输入语言
        let lang = self.textInputMode?.primaryLanguage
        var len = maxTextCount - toBeString.count
        
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
                    self.text = String(toBeString[..<idx])
                }
            }
        }
        else {
            if len < 0 {
                len = 0
                let idx = toBeString.index(toBeString.startIndex, offsetBy: maxTextCount)
                text = String(toBeString[..<idx])
            }
        }
        canInputMaxCount = max(0, len)
        textChangedClosure?(self, canInputMaxCount)
    }
    
    open override func updateConstraints() {
        
        self.contentOffset = CGPoint.zero
        self.contentInset = UIEdgeInsets.zero
        
        let container = self.textContainer
        
        placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: container.lineFragmentPadding).isActive = true
        placeholderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -container.lineFragmentPadding).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        placeholderLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        super.updateConstraints()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


