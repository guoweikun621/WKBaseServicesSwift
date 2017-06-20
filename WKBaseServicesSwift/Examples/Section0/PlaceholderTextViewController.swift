//
//  PlaceholderTextViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2017/6/20.
//  Copyright © 2017年 郭伟坤. All rights reserved.
//

import UIKit

class PlaceholderTextViewController: UIViewController {
    
    @IBOutlet weak var textView: WKPlaceholderTextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        textView.textChangedClosure = {
            debugPrint("\($1)")
        }

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
