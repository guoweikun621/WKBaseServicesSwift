//
//  WKHorizontalMenuView.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2016/11/29.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

@objc public protocol WKHorizontalMenuDelegate {
    optional func didSelectItem(menu: WKHorizontalMenuView, oldIndex: Int, selectedIndex: Int) -> Void
}

@IBDesignable
public class WKHorizontalMenuView: UIView {
    
    public weak var delegate: WKHorizontalMenuDelegate?
    public var didSelctedItem: ((menu: WKHorizontalMenuView, oldIndex: Int, selectedIndex: Int) ->Void)?

    var scrollView: UIScrollView!
    var underlineView: UIView!
    
    
    /// 选中索引
    public var selectedIndex: Int = 0 {
        didSet {
            updateSelectItem(oldValue)
        }
    }
    
    
    /// 菜单列表数组
    public var menuItems: [String] = [String]() {
        didSet {
            // 更新菜单
            configItems()
        }
    }
    
    private var config = ItemConfig()
    private var itemViews: [HorizontalMenuItemView] = [HorizontalMenuItemView]()
    
    
    /// 是否可以滚动，如No，则一页显示全部菜单，Default is true
    @IBInspectable public var scrollEnable: Bool {
        set {
            config.scrollEnable = newValue
        }
        get {
            return config.scrollEnable
        }
    }
    
    
    /// 未选中字体大小
    @IBInspectable public var textFontSize: CGFloat {
        set {
            config.textFontSize = newValue
        }
        get {
            return config.textFontSize
        }
    }
    
    
    /// 选中字体大小
    @IBInspectable public var selectFontSize: CGFloat {
        set {
            config.selectTextFontSize = newValue
        }
        get {
            return config.selectTextFontSize
        }
    }
    
    
    /// 未选中字体颜色
    @IBInspectable public var textColor: UIColor {
        set {
            config.textColor = newValue
        }
        get {
            return config.textColor
        }
    }
    
    
    /// 选中字体颜色
    @IBInspectable public var selectTextColor: UIColor {
        set {
            config.selectedTextColor = newValue
        }
        get {
            return config.selectedTextColor
        }
    }
    
    
    /// 选中下划线颜色
    @IBInspectable public var underLineColor: UIColor {
        set {
            config.underlineColor = newValue
        }
        get {
            return config.underlineColor
        }
    }
    
    @IBInspectable public var underlineHeight: CGFloat {
        set {
            config.underlineHeight = newValue
        }
        get {
            return config.underlineHeight
        }
    }
    
    // MARK: Init
    override public init(frame: CGRect) {
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
        
        underlineView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: self.height - underlineHeight), size: CGSize(width: self.itemWidth, height: underlineHeight)))
        underlineView.backgroundColor = underLineColor
        scrollView.addSubview(underlineView)
    }
    
    var itemWidth: CGFloat {
        let itemW = self.width / CGFloat(self.menuItems.count)
        return config.scrollEnable ? 80.0 : itemW
    }
    
    func configItems() {
        for v in scrollView.subviews {
            if v.isKindOfClass(HorizontalMenuItemView) {
                v.removeFromSuperview()
            }
        }
        var x: CGFloat = 0.0
        
        
        var idx = 0
        
        for title in menuItems {
            let item = HorizontalMenuItemView(frame: CGRect(x: x, y: 0, width: itemWidth, height: self.height))
            item.titleLabel.text = title
            if idx == selectedIndex {
                item.titleLabel.font = UIFont.systemFontOfSize(selectFontSize)
                item.titleLabel.textColor = selectTextColor
            }
            else {
                item.titleLabel.font = UIFont.systemFontOfSize(textFontSize)
                item.titleLabel.textColor = textColor
            }
            
            item.itemWidth = itemWidth
            x += itemWidth
            idx += 1
            item.addTarget(self, action: #selector(itemAction), forControlEvents: .TouchUpInside)
            scrollView.addSubview(item)
            itemViews.append(item)
        }
        underlineView.backgroundColor = underLineColor
        underlineView.size = CGSize(width: itemWidth, height: underlineHeight)
        scrollView.contentSize = CGSize(width: x, height: self.height)
    }
    
    public override func layoutSubviews() {
        //
        scrollView.frame = self.bounds
        var x: CGFloat = 0.0
        for item in itemViews {
            item.frame = CGRect(x: x, y: 0, width: itemWidth, height: self.height)
            item.itemWidth = itemWidth
            x += itemWidth
        }
        underlineView.size = CGSize(width: itemWidth, height: underlineHeight)
        scrollView.contentSize = CGSize(width: x, height: self.height)
        super.layoutSubviews()
    }
    
    @objc func itemAction(sender: HorizontalMenuItemView) {
        let selectTitle = sender.titleLabel.text ?? ""
        let index = menuItems.indexOf(selectTitle) ?? 0
        self.selectedIndex = index
    }
    
    func updateSelectItem(oldIndex: Int) {
        
        if oldIndex == selectedIndex {
            return
        }
        let oldItem = itemViews[oldIndex] as HorizontalMenuItemView
        let newItem = itemViews[selectedIndex] as HorizontalMenuItemView
        
        UIView.animateWithDuration(0.4, animations: { [weak self, newItem, oldItem] in
            self?.underlineView.frame = CGRect(origin: CGPoint(x: newItem.left, y: newItem.height - (self?.underlineHeight)!), size: (self?.underlineView.size)!)
            newItem.titleLabel.font = UIFont.systemFontOfSize((self?.selectFontSize)!)
            newItem.titleLabel.textColor = self?.selectTextColor
            oldItem.titleLabel.font = UIFont.systemFontOfSize((self?.textFontSize)!)
            oldItem.titleLabel.textColor = self?.textColor
            }) { (flag) in
                
        }

        // 处理回调方法
        didSelctedItem?(menu: self, oldIndex: oldIndex, selectedIndex: selectedIndex)
        delegate?.didSelectItem?(self, oldIndex: oldIndex, selectedIndex: selectedIndex)
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
    
    public var titleLabel: UILabel!
    public var itemWidth: CGFloat?
    
    func setupView() {
        backgroundColor = UIColor.clearColor()
        
        titleLabel = UILabel(frame: self.bounds)
        titleLabel.textAlignment = .Center
        titleLabel.backgroundColor = UIColor.clearColor()
        addSubview(titleLabel)
    }
    
    public override func layoutSubviews() {
        titleLabel.frame = self.bounds
        super.layoutSubviews()
    }
}

public struct ItemConfig {
    public var textColor: UIColor = UIColor.color("333333")
    public var selectedTextColor: UIColor = UIColor.blueColor()
    public var textFontSize: CGFloat = 13.0
    public var selectTextFontSize: CGFloat = 14.0
    public var underlineColor: UIColor = UIColor.blueColor()
    public var underlineHeight: CGFloat = 1.0
    public var scrollEnable: Bool = true
}
