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
    
    var isLoad = false
    var currentIndex = 1
    var oldCurrentIndex = -1
    var maxItem = 5
    
    var itemHeight : CGFloat  = 325
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initData()
    }
    
    func initView(){
        tableTableView.contentInset =  UIEdgeInsetsMake(0, 0, 69, 0)
        // setup loadding tableview
        self.tableTableView.tableFooterView = self.tableTableView.dequeueReusableCellWithIdentifier("tableLoadingView")
        self.tableTableView.tableFooterView!.hidden = true
    }
    
    func initData(){
//        KVNProgress.show()
        loadDataMore(currentIndex)
    }
    
    override func viewDidAppear(animated: Bool) {
        AppDelegate.drawer?.openDrawerGestureModeMask  = .BezelPanningCenterView
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
        cell.percentDiscountLabel.text = "\(data.percentDiscount) %"
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
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if !isLoad && indexPath.row == currentIndex - 1 && currentIndex != oldCurrentIndex {
            oldCurrentIndex = currentIndex
            isLoad = true
            self.loadDataMore( (self.currentIndex + self.maxItem) / self.maxItem)
        }
    }
    
    func loadDataMore(index :Int)
    {
        tableTableView.tableFooterView?.frame.size.height = 45
        refreshLoadingViewTo(true)
        Service.getInstance().get("products",parameters: ["page":index,"limit":maxItem], type: ProductModel.self) { (result, data, errorMessage) in
            self.isLoad = false
            self.listData.appendContentsOf(data!)
            self.currentIndex = self.listData.count
            self.tableTableView.reloadData()
            KVNProgress.dismiss()
            self.refreshLoadingViewTo(false)
             self.tableTableView.tableFooterView?.frame.size.height = 0
            self.tableTableView.tableFooterView!.layoutIfNeeded()
        }
    }
    
    func refreshLoadingViewTo(isLoad :Bool ){
        if tableTableView.tableFooterView != nil {
            UIView.transitionWithView(tableTableView.tableFooterView!, duration: 0.2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.tableTableView.tableFooterView!.hidden = !isLoad
                }, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
    
}
