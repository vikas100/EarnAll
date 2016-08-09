//
//  ProductViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/9/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class ProductViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        settingButtonBarPagerTab()
        super.viewDidLoad()
        
    }
    
    func settingButtonBarPagerTab(){
        buttonBarView.frame.origin.y = 64
        settings.style.buttonBarBackgroundColor = .whiteColor()
        settings.style.buttonBarItemBackgroundColor = .whiteColor()
        settings.style.selectedBarBackgroundColor = UIColor.blueColor()
        settings.style.buttonBarItemFont = .boldSystemFontOfSize(14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .blackColor()
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
//        settings.style.buttonBarHeight = 20
        
        buttonBarView.frame = CGRect(x: 0, y: 64, width: buttonBarView.frame.width, height: 35)
        
        let treashow = 64 + buttonBarView.frame.height
        containerView.frame = CGRect(x: 0, y: treashow, width: containerView.frame.width, height: containerView.frame.height - treashow)
        
        changeCurrentIndexProgressive = {  (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .blackColor()
            newCell?.label.textColor = .blueColor()
            
        }
    }
    
    override func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let f1 = self.storyboard?.instantiateViewControllerWithIdentifier("ProductFilterPageViewController") as! ProductFilterPageViewController
        
        f1.itemInfo = "วันที่"

        let filter2 = ProductFilterPageViewController(itemInfo: "คะแนนมากสุด")
        let filter3 = ProductFilterPageViewController(itemInfo: "ยอดนิยม")
        return [f1,filter2,filter3]
    }
    
    @IBAction func hamburgerButtonAction(sender: AnyObject) {
        toggleLeftHamburger()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
