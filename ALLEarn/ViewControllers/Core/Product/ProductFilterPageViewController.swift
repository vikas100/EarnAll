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
    
    var placeHolderImageName = "allearnThumbnail"
    
    var filter = ""
    var category = ""
    
    var isLoad = false
    var currentIndex = 1
    var oldCurrentIndex = -1
    var maxItem = 10
    
    var refreshControl:UIRefreshControl!
    
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
        self.refreshControl = UIRefreshControl()
//        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(ProductFilterPageViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        tableTableView.addSubview(refreshControl)
        
    }
    
    
    func refresh(sender:AnyObject)
    {
        listData = [ProductModel]()
        currentIndex = 1
        isLoad = false
        oldCurrentIndex = -1
        loadDataMore(currentIndex)
        self.refreshControl.endRefreshing()
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
        
        cell.imageContentImageView.kf_setImageWithURL(NSURL(string: data.image.thumb)!, placeholderImage: UIImage(named: placeHolderImageName))
        cell.imageStoreImageView.kf_setImageWithURL(NSURL(string: data.business.thumb)!, placeholderImage: UIImage(named: placeHolderImageName))
        cell.categoryImageView.image = UIImage(named: "food2")
        cell.ratingStarRatingView.value = data.statistic.rating
        cell.headerLabel.text = data.title
        cell.dateLabel.text = "ภายใน " + "19/8/59"
        cell.unitDiscountLabel.text = "จากยอด"
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
        Service.getInstance().get("products",parameters: ["page":index,"limit":maxItem,"include":"business","business_fields":"picture"], type: ProductModel.self) { (result, data, errorMessage) in
            self.isLoad = false
            self.refreshLoadingViewTo(false)
            KVNProgress.dismiss()
            if data != nil {
                self.listData.appendContentsOf(data!)
                self.currentIndex = self.listData.count
                self.tableTableView.reloadData()
                self.tableTableView.tableFooterView?.frame.size.height = 0
                self.tableTableView.tableFooterView!.layoutIfNeeded()
            }
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
