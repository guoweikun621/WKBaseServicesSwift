//
//  WKHorizontalMenuView.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2016/11/29.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

@objc protocol WKHorizontalMenuDelegate {
    optional func didSelectItem(oldItem: HorizontalMenuItemView, selectedItem: HorizontalMenuItemView) -> Void
}

@IBDesignable
public class WKHorizontalMenuView: UIView {
    
    var delegate: WKHorizontalMenuDelegate?
    var didSelctedItem: ((oldItem: HorizontalMenuItemView, selectedItem: HorizontalMenuItemView) ->Void)?
    
    
    var scrollView: UIScrollView!
    var underlineView: UIView!
    var selectedIndex: Int = 0 {
        didSet {
            updateSelectItem(oldValue)
        }
    }
    
    
    var menuItems: [String] = [String]() {
        didSet {
            // 更新菜单
            configItems()
        }
    }
    
    private var config = ItemConfig()
    private var itemViews: [HorizontalMenuItemView] = [HorizontalMenuItemView]()
    
    @IBInspectable var textFontSize: CGFloat {
        set {
            config.textFontSize = newValue
        }
        get {
            return config.textFontSize
        }
    }
    @IBInspectable var selectFontSize: CGFloat {
        set {
            config.selectTextFontSize = newValue
        }
        get {
            return config.selectTextFontSize
        }
    }
    @IBInspectable var textColor: UIColor {
        set {
            config.textColor = newValue
        }
        get {
            return config.textColor
        }
    }
    @IBInspectable var selectTextColor: UIColor {
        set {
            config.selectedTextColor = newValue
        }
        get {
            return config.selectedTextColor
        }
    }
    @IBInspectable var underLineColor: UIColor {
        set {
            config.underlineColor = newValue
        }
        get {
            return config.underlineColor
        }
    }
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        scrollView = UIScrollView(frame: self.bounds);
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        addSubview(scrollView)
        
        underlineView = UIView(frame: CGRect(origin: CGPoint(x: 10.0, y: self.height-1), size: CGSize(width: 60, height: 1)))
        underlineView.backgroundColor = underLineColor
        scrollView.addSubview(underlineView)
    }
    
    func configItems() {
        for v in scrollView.subviews {
            if v.isKindOfClass(HorizontalMenuItemView) {
                v.removeFromSuperview()
            }
        }
        var x: CGFloat = 0.0
        for title in menuItems {
            let item = HorizontalMenuItemView(frame: CGRect(x: x, y: 0, width: 80, height: self.height))
            item.titleLabel.text = title
            item.titleLabel.font = UIFont.systemFontOfSize(textFontSize)
            item.titleLabel.textColor = textColor
            x += 80
            item.addTarget(self, action: #selector(itemAction), forControlEvents: .TouchUpInside)
            scrollView.addSubview(item)
            itemViews.append(item)
        }
        underlineView.backgroundColor = underLineColor
        scrollView.contentSize = CGSize(width: x + 80, height: self.height)
    }
    
    @objc func itemAction(sender: HorizontalMenuItemView) {
        let selectTitle = sender.titleLabel.text ?? ""
        let index = menuItems.indexOf(selectTitle) ?? 0
        self.selectedIndex = index
    }
    
    func updateSelectItem(oldIndex: Int) {
        let oldItem = itemViews[oldIndex] as HorizontalMenuItemView
        if oldIndex == selectedIndex {
            oldItem.titleLabel.font = UIFont.systemFontOfSize(textFontSize)
            oldItem.titleLabel.textColor = self.textColor
            return
        }
        
        let newItem = itemViews[selectedIndex] as HorizontalMenuItemView
        
        UIView.animateWithDuration(0.4, animations: { [weak self, newItem, oldItem] in
            self?.underlineView.frame = CGRect(origin: CGPoint(x: newItem.left+10, y: newItem.height - 1), size: (self?.underlineView.size)!)
            newItem.titleLabel.font = UIFont.systemFontOfSize((self?.selectFontSize)!)
            newItem.titleLabel.textColor = self?.selectTextColor
            oldItem.titleLabel.font = UIFont.systemFontOfSize((self?.textFontSize)!)
            oldItem.titleLabel.textColor = self?.textColor
            }) { (flag) in
                
        }

        // 处理回调方法
        didSelctedItem?(oldItem: oldItem, selectedItem: newItem)
        delegate?.didSelectItem?(oldItem, selectedItem: newItem)
    }
    
    func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if flag {
            let newItem = itemViews[selectedIndex] as HorizontalMenuItemView
            var uframe = underlineView.frame
            uframe.origin = newItem.origin
            underlineView.frame = uframe
        }
    }
}

public class HorizontalMenuItemView: UIControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleLabel: UILabel!
    
    func setupView() {
        backgroundColor = UIColor.clearColor()
        
        titleLabel = UILabel(frame: self.bounds)
        titleLabel.textAlignment = .Center
        titleLabel.backgroundColor = UIColor.clearColor()
        addSubview(titleLabel)
    }
}

public struct ItemConfig {
    var textColor: UIColor = UIColor.color("333333")
    var selectedTextColor: UIColor = UIColor.blueColor()
    var textFontSize: CGFloat = 13.0
    var selectTextFontSize: CGFloat = 14.0
    var underlineColor: UIColor = UIColor.blueColor()
}
