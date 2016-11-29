//
//  ViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/18.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var menuView: WKHorizontalMenuView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        menuView.menuItems = ["全部", "待确认", "待进场", "已完成", "其它"]
        
    }
}

