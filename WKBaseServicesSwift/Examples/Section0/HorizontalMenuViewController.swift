//
//  HorizontalMenuViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2016/12/14.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

class HorizontalMenuViewController: UIViewController {
    
    @IBOutlet weak var countDownButton: WKCountDownButton!
    
    var idx: Int?
    
    let menus = ["全部", "随便", "都行", "看你", "其它", "临时", "备注"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func countDownAction(_ sender: WKCountDownButton) {
        sender.fire()
    }
    

}
