//
//  Section0TableViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2017/6/20.
//  Copyright © 2017年 郭伟坤. All rights reserved.
//

import UIKit

class Section0TableViewController: UITableViewController {
    
    var rowArray = ["HorizontalMenu", "PlaceholderText"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setDefalutBgColor()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // HorizontalMenuSegue
        
        // PlaceholderTextSegue
        
    }

}

extension Section0TableViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rowArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Section0Cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = rowArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        switch row {
        case 0:
            performSegue(withIdentifier: "HorizontalMenuSegue", sender: indexPath)
        case 1:
            performSegue(withIdentifier: "PlaceholderTextSegue", sender: indexPath)
        default:
            break
        }
        
    }
}
