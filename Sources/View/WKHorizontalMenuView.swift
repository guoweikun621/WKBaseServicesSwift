//
//  WKHorizontalMenuView.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2016/11/29.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

@objc public protocol WKHorizontalMenuDelegate {
    @objc optional func didSelectItem(menu: WKHorizontalMenuView, oldIndex: Int, selectedIndex: Int) -> Void
}

@IBDesignable
open class WKHorizontalMenuView: UIView {
    
    
    /// 代理
    public weak var delegate: WKHorizontalMenuDelegate?
    
    /// 回调方法
    public var didSelctedItem: ((_ menu: WKHorizontalMenuView, _ oldIndex: Int, _ selectedIndex: Int) ->Void)?

    var scrollView: UIScrollView!
    var underlineView: UIView!
    
    
    /// 选中索引
    open var selectedIndex: Int = 0 {
        didSet {
            updateSelectItem(oldIndex: oldValue)
        }
    }
    
    
    /// 菜单列表数组
    open var menuItems: [String] = [String]() {
        didSet {
            // 更新菜单
            configItems()
            setNeedsLayout()
        }
    }
    
    private var config = ItemConfig()
    private var itemViews: [HorizontalMenuItemView] = [HorizontalMenuItemView]()
    
    
    /// 是否可以滚动，如No，则一页显示全部菜单，Default is true
    @IBInspectable open var scrollEnable: Bool {
        set {
            config.scrollEnable = newValue
        }
        get {
            return config.scrollEnable
        }
    }
    
    
    /// 未选中字体大小
    @IBInspectable open var textFontSize: CGFloat {
        set {
            config.textFontSize = newValue
        }
        get {
            return config.textFontSize
        }
    }
    
    
    /// 选中字体大小
    @IBInspectable open var selectFontSize: CGFloat {
        set {
            config.selectTextFontSize = newValue
        }
        get {
            return config.selectTextFontSize
        }
    }
    
    
    /// 未选中字体颜色
    @IBInspectable open var textColor: UIColor {
        set {
            config.textColor = newValue
        }
        get {
            return config.textColor
        }
    }
    
    
    /// 选中字体颜色
    @IBInspectable open var selectTextColor: UIColor {
        set {
            config.selectedTextColor = newValue
        }
        get {
            return config.selectedTextColor
        }
    }
    
    
    /// 选中下划线颜色
    @IBInspectable open var underLineColor: UIColor {
        set {
            config.underlineColor = newValue
        }
        get {
            return config.underlineColor
        }
    }
    
    @IBInspectable open var underlineHeight: CGFloat {
        set {
            config.underlineHeight = newValue
        }
        get {
            return config.underlineHeight
        }
    }
    
    @IBInspectable open var isUnderSeparator: Bool = true {
        didSet {
            if isUnderSeparator {
                self.addBottomLine(color: UIColor.color(hexString: "cccccc"))
            }
            else {
                self.clearSeparatorLine()
            }
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
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = true
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.contentOffset = CGPoint.zero
        addSubview(scrollView)
        
        underlineView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: self.height - underlineHeight), size: CGSize(width: self.itemWidth, height: underlineHeight)))
        underlineView.backgroundColor = underLineColor
        scrollView.addSubview(underlineView)
    }
    
    var itemWidth: CGFloat {
        let count = self.menuItems.count == 0 ? CGFloat(1.0) : CGFloat(self.menuItems.count)
        
        let itemW = self.width / count
        return config.scrollEnable ? 80.0 : itemW
    }
    
    func configItems() {
        itemViews.removeAll()
        for v in scrollView.subviews {
            if v.isKind(of: HorizontalMenuItemView.self) {
                v.removeFromSuperview()
            }
        }
        var x: CGFloat = 0.0
        
        
        var idx = 0
        
        for title in menuItems {
            let item = HorizontalMenuItemView(frame: CGRect(x: x, y: 0, width: itemWidth, height: self.height))
            item.titleLabel.text = title
            if idx == selectedIndex {
                item.titleLabel.font = UIFont.systemFont(ofSize: selectFontSize)
                item.titleLabel.textColor = selectTextColor
            }
            else {
                item.titleLabel.font = UIFont.systemFont(ofSize: textFontSize)
                item.titleLabel.textColor = textColor
            }
            
            item.itemWidth = itemWidth
            x += itemWidth
            idx += 1
            item.addTarget(self, action: #selector(itemAction), for: .touchUpInside)
            scrollView.addSubview(item)
            itemViews.append(item)
        }
        underlineView.backgroundColor = underLineColor
        underlineView.size = CGSize(width: itemWidth, height: underlineHeight)
        scrollView.contentSize = CGSize(width: x, height: 0)
    }
    
    open override func layoutSubviews() {
        //
        scrollView.frame = self.bounds
        
        var x: CGFloat = 0.0
        for item in itemViews {
            item.frame = CGRect(x: x, y: 0, width: itemWidth, height: self.height)
            item.itemWidth = itemWidth
            x += itemWidth
        }
        let underX: CGFloat = itemWidth * CGFloat(selectedIndex)
        
        underlineView.frame = CGRect(origin: CGPoint(x: underX, y: self.height-self.underlineHeight), size: CGSize(width: itemWidth, height: underlineHeight))
        scrollView.contentSize = CGSize(width: x, height: 0)
        scrollView.contentOffset = CGPoint.zero
        scrollView.contentInset = UIEdgeInsets.zero
        super.layoutSubviews()
    }
    
    @objc func itemAction(sender: HorizontalMenuItemView) {
        let selectTitle = sender.titleLabel.text ?? ""
        let index = menuItems.index(of: selectTitle) ?? 0
        self.selectedIndex = index
    }
    
    func updateSelectItem(oldIndex: Int) {
        if menuItems.count == 0 {
            return
        }
        if oldIndex == selectedIndex {
            return
        }
        let oldItem = itemViews[oldIndex] as HorizontalMenuItemView
        let newItem = itemViews[selectedIndex] as HorizontalMenuItemView
        
        UIView.animate(withDuration: 0.4, animations: { [weak self, newItem, oldItem] in
            self?.underlineView.frame = CGRect(origin: CGPoint(x: newItem.left, y: newItem.height - (self?.underlineHeight)!), size: CGSize(width: newItem.itemWidth!, height: (self?.underlineHeight)!))
            newItem.titleLabel.font = UIFont.systemFont(ofSize: (self?.selectFontSize)!)
            newItem.titleLabel.textColor = self?.selectTextColor
            oldItem.titleLabel.font = UIFont.systemFont(ofSize: (self?.textFontSize)!)
            oldItem.titleLabel.textColor = self?.textColor
            }) { (flag) in
                
        }

        // 处理回调方法
        didSelctedItem?(self, oldIndex, selectedIndex)
        delegate?.didSelectItem?(menu: self, oldIndex: oldIndex, selectedIndex: selectedIndex)
    }
}

open class HorizontalMenuItemView: UIControl {
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
        backgroundColor = UIColor.clear
        
        titleLabel = UILabel(frame: self.bounds)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor.clear
        addSubview(titleLabel)
    }
    
    open override func layoutSubviews() {
        titleLabel.frame = self.bounds
        super.layoutSubviews()
    }
}


/// 选项配置项
public struct ItemConfig {
    public var textColor: UIColor = UIColor.color(hexString: "333333")
    public var selectedTextColor: UIColor = UIColor.color(hexString: "333333")
    public var textFontSize: CGFloat = 13.0
    public var selectTextFontSize: CGFloat = 14.0
    public var underlineColor: UIColor = UIColor.groupTableViewBackground
    public var underlineHeight: CGFloat = 1.0
    public var scrollEnable: Bool = true
}
