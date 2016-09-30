//
//  PhotoBrowserViewController.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 2016/9/30.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

public class WKPhotoBrowserViewController: UICollectionViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }


    // MARK: UICollectionViewDataSource



    // MARK: UICollectionViewDelegate



}
