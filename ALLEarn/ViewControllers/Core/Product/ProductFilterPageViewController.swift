//
//  ProductFilterPageViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/9/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ProductFilterPageViewController:BaseIndiCatorInfoProvider, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductFilterTAbleViewCell", forIndexPath: indexPath) as! ProductFilterUITableViewCell
//        cell.layer.shadowColor = UIColor.grayColor().CGColor
//        cell.layer.shadowOffset =  CGSizeMake(0.0,1.0)
//        cell.layer.shadowRadius = 5.0
//        cell.layer.shadowOpacity = 0.5
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 265
    }
    
}
