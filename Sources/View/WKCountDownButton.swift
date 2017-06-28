//
//  WKCountDownButton.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2017/6/28.
//  Copyright © 2017年 郭伟坤. All rights reserved.
//

import UIKit

@IBDesignable
public class WKCountDownButton: UIButton {

    @IBInspectable public var identifyKey: String = NSStringFromClass(WKCountDownButton.self)
    @IBInspectable public var disabledBackgroundColor: UIColor?
    @IBInspectable public var disabledTitleColor: UIColor?
    @IBInspectable public var timeInterval: TimeInterval = 60.0   // 默认60s
    @IBInspectable public var retryTitle: String = "重新获取"

    var overlayLabel: UILabel!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() -> Void {
        self.clipsToBounds = true
        self.layer.cornerRadius = 4;
        self.timeInterval = 60.0;
        
        overlayLabel = UILabel()
        overlayLabel.textColor = titleLabel?.textColor
        overlayLabel.backgroundColor = backgroundColor
        overlayLabel.textAlignment = .center
        overlayLabel.font = titleLabel?.font
        overlayLabel.isHidden = true
        addSubview(overlayLabel)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        overlayLabel.frame = self.bounds
        var task: CountDownTask?
        if CountDownManager.shared.coundownTaskExistWith(key: self.identifyKey, task: &task) {
            shouldCountDown()
        }
    }
    
    func shouldCountDown() {
        self.isEnabled = false
        self.titleLabel?.alpha = 0
        self.overlayLabel.isHidden = false
        self.overlayLabel.text = self.titleLabel?.text
        self.overlayLabel.backgroundColor = disabledBackgroundColor != nil ? disabledBackgroundColor : backgroundColor
        self.overlayLabel.textColor = disabledTitleColor != nil ? disabledTitleColor : self.titleLabel?.textColor
        
        CountDownManager.shared.scheduledCountDownWith(key: self.identifyKey, timeInteval: self.timeInterval, countingDown: { [weak self] (leftTime) in
            self?.overlayLabel.text = "\(Int(leftTime)) 秒后重试"
        }) { [weak self] (finishedTime) in
            
            self?.isEnabled = true
            self?.overlayLabel.isHidden = true
            self?.titleLabel?.alpha = 1
            if ((self?.retryTitle.lenght ?? 0) > 0) {
                self?.setTitle(self?.retryTitle, for: .normal)
            }
            
            self?.overlayLabel.backgroundColor = self?.backgroundColor
            self?.overlayLabel.textColor = self?.titleLabel?.textColor
        }

    }
    
    override public func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        if ((self.actions(forTarget: target, forControlEvent: .touchUpInside)?.count) == nil) {
            return
        }
        super.sendAction(action, to: target, for: event)
    }
    
    public func fire() {
        shouldCountDown()
    }
}


final public class CountDownManager: NSObject {

    public static let shared : CountDownManager = CountDownManager()
    
    public var pool: OperationQueue = OperationQueue()

    
    /**
     *  开始倒计时，如果倒计时管理器里具有相同的key，则直接开始回调。
     *
     *  @param Key         任务key，用于标示唯一性
     *  @param timeInterval 倒计时总时间，
     *  @param countingDown 倒计时时，会多次回调，提供当前秒数
     *  @param finished     倒计时结束时调用，提供当前秒数，值恒为 0
     */
    public func scheduledCountDownWith(key: String, timeInteval: TimeInterval, countingDown:((TimeInterval) -> Void)?,finished:((TimeInterval) -> Void)?) {
        
        var task: CountDownTask?
        if coundownTaskExistWith(key: key, task: &task) {
            task?.countingDownBlcok = countingDown
            task?.finishedBlcok = finished
            if countingDown != nil {
                countingDown!((task?.leftTimeInterval) ?? 60)
            }
        } else {
            task = CountDownTask()
            task?.leftTimeInterval = timeInteval
            task?.countingDownBlcok = countingDown
            task?.finishedBlcok = finished
            task?.name = key
            
            pool.addOperation(task!)
        }
    }
    
    /**
     *  查询倒计时任务是否存在
     *
     *  @param akey 任务key
     *  @param task 任务
     *  @return YES - 存在， NO - 不存在
     */
    public func coundownTaskExistWith(key: String, task: inout CountDownTask? ) -> Bool {
        var taskExits = false
        
        for (_, obj)  in pool.operations.enumerated() {
            let temptask = obj as! CountDownTask
            if temptask.name == key {
                task = temptask
                taskExits = true
                break
            }
        }
        return taskExits
    }
    
    /**
     *  取消所有倒计时任务
     */
    func cancelAllTask() {
        pool.cancelAllOperations()
    }
    
    /**
     *  挂起所有倒计时任务
     */
    private func suspendAllTask() {
        pool.isSuspended = true
    }
}


final public class CountDownTask: Operation {
    public var leftTimeInterval: TimeInterval = 0
    public var countingDownBlcok: ((TimeInterval) -> Void)?
    public var finishedBlcok: ((TimeInterval) -> Void)?
    
    override public func main() {
        
        if self.isCancelled {
            return
        }
        while leftTimeInterval > 0 {
            if self.isCancelled {
                return
            }
            leftTimeInterval -= 1
            DispatchQueue.main.async(execute: {
                if self.countingDownBlcok != nil {
                    self.countingDownBlcok!(self.leftTimeInterval)
                }
            })
            Thread.sleep(forTimeInterval: 1)
        }
        
        DispatchQueue.main.async() {
            if self.isCancelled {
                return
            }
            if self.finishedBlcok != nil {
                self.finishedBlcok!(0)
            }
        }
    }
}
