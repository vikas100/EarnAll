//
//  ProductFilterPageViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/9/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Kingfisher
import KVNProgress
class ProductFilterPageViewController:BaseIndiCatorInfoProvider, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableTableView: UITableView!
   
    var listData = [ProductModel]()
    
    var itemHeight : CGFloat  = 325
    override func viewDidLoad() {
        super.viewDidLoad()
        tableTableView.contentInset =  UIEdgeInsetsMake(0, 0, 69, 0)
        initData()
    }
    
    
    func initData(){
        KVNProgress.show()
        Service.getInstance().get("products", type: ProductModel.self) { (result, data, errorMessage) in
            self.listData = data!
            self.tableTableView.reloadData()
            KVNProgress.dismiss()
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.tabBarController?.tabBar.translucent = true
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductFilterTAbleViewCell", forIndexPath: indexPath) as! ProductFilterUITableViewCell
        let index = indexPath.row
        let data = listData[index]
      
            cell.imageContentImageView.kf_setImageWithURL(NSURL(string: data.image.thumb)!, placeholderImage: UIImage(named: "load-icon"))
//            cell.imageContentImageView.image = UIImage(named: "test")
            cell.imageStoreImageView.image = UIImage(named: "test33")
            cell.categoryImageView.image = UIImage(named: "food2")
            cell.ratingStarRatingView.value = data.statistic.rating
            cell.headerLabel.text = data.title
            cell.dateLabel.text = "ภายใน " + "19/8/59"
            cell.viewNumberLabel.text = "\(Utils.convertNumberToStringCurrency( Double(data.statistic.view)) ) วิว"
            cell.usedNumberLabel.text = "\(Utils.convertNumberToStringCurrency( Double(data.statistic.usage))) ครั้ง"
            cell.donateNumberLabel.text = "\(Utils.convertNumberToStringCurrency( Double(data.statistic.donate))) บาท"
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
