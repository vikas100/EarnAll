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
    @IBOutlet weak var tableTableView: UITableView!
    
    var itemHeight : CGFloat  = 355//335
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController!.tabBarController?.tabBar.translucent = true

//        if Utils.checkSize() == .iPhone5 || Utils.checkSize() == .iPhone4 {
//            itemHeight = 355
//        }
        tableTableView.contentInset =  UIEdgeInsetsMake(0, 0, 69, 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.tabBarController?.tabBar.translucent = true

    }
//   
//    override func viewWillAppear(animated: Bool) {
//        UIView.animateWithDuration(3, delay: 0, options: .CurveEaseIn, animations: {
//            self.tabBarController?.tabBar.layer.zPosition = 0
//            }, completion: nil)
//        
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
        return itemHeight
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//         self.hidesBottomBarWhenPushed = true
        performSegueWithIdentifier("productToDetailPage", sender: nil)
//         self.hidesBottomBarWhenPushed = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//     segue.destinationViewController.hidesBottomBarWhenPushed = true
    }
    
}
