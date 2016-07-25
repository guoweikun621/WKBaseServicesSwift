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
        let alert = UIAlertController.init(message: "tips message", preferredStyle: .Alert);
        
        self.presentViewController(alert, animated: true, completion: nil);
    }
}

