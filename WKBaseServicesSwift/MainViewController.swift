//
//  ViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/18.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let exampleList = ["HorizontalMenuView"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
 
    }
    
    // MARK: - UITableView Delegate And DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MainTableCell")!
        cell.textLabel?.text = exampleList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        
        if row == 0 {
            performSegueWithIdentifier("HorizontalMenuSegue", sender: nil)
        }
    }
    
    // Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identifier = segue.identifier
        let controller = segue.destinationViewController
        
        // HorizontalMenuSegue
        if identifier == "HorizontalMenuSegue" {
            let menuController = controller as! HorizontalMenuViewController
            menuController.idx = Int(arc4random_uniform(5))
        }
    }
}

