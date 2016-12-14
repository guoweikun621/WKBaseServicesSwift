//
//  HorizontalMenuViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2016/12/14.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

class HorizontalMenuViewController: UIViewController {
    
    @IBOutlet weak var menuView: WKHorizontalMenuView!
    
    var idx: Int?
    
    let menus = ["全部", "随便", "都行", "看你", "其它"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuView.menuItems = ["全部", "随便", "都行", "看你", "其它"]
        menuView.selectedIndex = 0
    }

    

}