//
//  ViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/18.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
    }

    
    @IBAction func testAction(sender: AnyObject) {
//        let alert = UIAlertController.initWithMessage("test message", confirmHandler: { (alertAction: UIAlertAction) in
//            
//        }) { (alertAction: UIAlertAction) in
//                
//        }
//        let alert = UIAlertController.init(title: "提示", message: "convenience init", confirmHandler: { (alertAction: UIAlertAction) in
//            print("confirm acion");
//        }) { (alertAction: UIAlertAction) in
//            print("cancel action");
//        }
        let alert = UIAlertController.init(message: "tips message");
        
        self.presentViewController(alert, animated: true, completion: nil);
    }
}

