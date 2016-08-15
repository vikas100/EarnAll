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
    
    var itemHeight : CGFloat  = 355
    override func viewDidLoad() {
        super.viewDidLoad()
        tableTableView.contentInset =  UIEdgeInsetsMake(0, 0, 69, 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.tabBarController?.tabBar.translucent = true
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductFilterTAbleViewCell", forIndexPath: indexPath) as! ProductFilterUITableViewCell
        let index = indexPath.row
        if index % 2 == 0 {
            cell.imageContentImageView.image = UIImage(named: "test")
            cell.imageStoreImageView.image = UIImage(named: "test33")
            cell.categoryImageView.image = UIImage(named: "food2")
            cell.ratingStarRatingView.value = 5
            cell.headerLabel.text = "อันยอง~ Korean Dessert Cafe สไตล์เกาหลีของจริง"
            cell.dateLabel.text = "ภายใน " + "19/8/59"
            cell.viewNumberLabel.text = "789 วิว"
            cell.usedNumberLabel.text = "777 ครั้ง"
            cell.donateNumberLabel.text = "1,200 บาท"
        }
        else{
            cell.imageContentImageView.image = UIImage(named: "test33")
            cell.imageStoreImageView.image = UIImage(named: "test")
            cell.categoryImageView.image = UIImage(named: "growth")
            cell.ratingStarRatingView.value = 2.5
            cell.headerLabel.text = "อันยอง~ Korean Dessert Cafe สไตล์เกาหลีของจริง"
            cell.dateLabel.text = "ภายใน " + "19/8/59"
            cell.viewNumberLabel.text = "99 วิว"
            cell.usedNumberLabel.text = "98 ครั้ง"
            cell.donateNumberLabel.text = "512.78 บาท"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return itemHeight
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("productToDetailPage", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
    
}
