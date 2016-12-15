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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableCell")!
        cell.textLabel?.text = exampleList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        if row == 0 {
            performSegue(withIdentifier: "HorizontalMenuSegue", sender: nil)
        }
    }
    
    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        let controller = segue.destination
        
        // HorizontalMenuSegue
        if identifier == "HorizontalMenuSegue" {
            let menuController = controller as! HorizontalMenuViewController
            menuController.idx = Int(arc4random_uniform(5))
        }
    }
}

