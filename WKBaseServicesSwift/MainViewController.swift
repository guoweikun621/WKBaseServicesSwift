//
//  ViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/18.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var demoView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        demoView.addLeftLine(UIColor.yellowColor(), top: 15, bottom: 15)
        demoView.addRightLine(UIColor.greenColor(), top: 15, bottom: 15)
        demoView.addTopLine(UIColor.grayColor(), leading: 15, tailing: 15)
        demoView.addBottomLine(UIColor.redColor(), leading: 15, tailing: 15)

        let dn = NSDecimalNumber.init(float: -0.1)
        if dn.isGreaterThanAndEqualZero() {
            textView.text = Device.uuid()
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
    }

    
    @IBAction func testAction(sender: AnyObject) {
        demoView.clearSeparatorLine()
    }
}

