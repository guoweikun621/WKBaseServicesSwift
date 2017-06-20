//
//  ViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/18.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    var tabMenu = [UIViewController]()
    
    func setupView() {
        let section0 = self.storyboard?.instantiateViewController(withIdentifier: "Section0")
        section0?.title = "Section0"
        let section1 = self.storyboard?.instantiateViewController(withIdentifier: "Section1")
        section1?.title = "Section1"
        
        if let s0 = section0, let s1 = section1 {
            tabMenu.append(contentsOf: [s0, s1])
        }
        
        self.setViewControllers(tabMenu, animated: false)
    }
    
    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}

