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
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        _ = demoView.addLeftLine(color: UIColor.yellow, top: 15, bottom: 15)
        _ = demoView.addRightLine(color: UIColor.green, top: 15, bottom: 15)
        _ = demoView.addTopLine(color: UIColor.gray, leading: 15, tailing: 15)
        _ = demoView.addBottomLine(color: UIColor.red, leading: 15, tailing: 15)

        let dn = NSDecimalNumber(value: 0.01)
        if dn.isGreaterThanAndEqualZero() {
            textView.text = dn.currenyString()
        }
        
        let name = "郭伟坤";
        textView.text = name.pinyin()
        
        imageView.image = UIImage.image(color: UIColor.red)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }

    
    @IBAction func testAction(sender: AnyObject) {
        // demoView.clearSeparatorLine()
        _ = WKAlertController.actionSheet(message: "test", defaluts: ["Defalut"]) { (action) in
            
        }
    }
}

