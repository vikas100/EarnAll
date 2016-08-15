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
        setFontTitleBar()
    }
    
    func settingButtonBarPagerTab(){
        
        buttonBarView.frame.origin.y = 64
        let hilightColor  = UIColor.blackColor() //ColorManager.getDarkGreen()
        let backgroudColor  = UIColor.clearColor()// ColorManager.getBluePastel()
        
        
        //     UITabBar.appearance().ba
        settings.style.buttonBarBackgroundColor = backgroudColor
        settings.style.buttonBarItemBackgroundColor = backgroudColor
        settings.style.selectedBarBackgroundColor = .whiteColor()
        settings.style.buttonBarItemFont =  UIFont(name: "SukhumvitSet-SemiBold", size: 14)!//.boldSystemFontOfSize(14)
        //        settings.style.co
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = UIColor.whiteColor()
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        //        settings.style.buttonBarHeight = 20
        
        buttonBarView.frame = CGRect(x: 0, y: 64, width: buttonBarView.frame.width, height: 35)
        
        let treashow = 64 + buttonBarView.frame.height + 1
        containerView.frame = CGRect(x: 0, y: treashow, width: containerView.frame.width, height: (containerView.frame.height - treashow ) + 64)
        
        changeCurrentIndexProgressive = {  (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = hilightColor
            newCell?.label.textColor = .whiteColor()
            
        }
    }
    
    override func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let filter1 = self.storyboard?.instantiateViewControllerWithIdentifier("ProductFilterPageViewController") as! ProductFilterPageViewController
        filter1.itemInfo = "วันที่"
        
        let filter2 = self.storyboard?.instantiateViewControllerWithIdentifier("ProductFilterPageViewController") as! ProductFilterPageViewController
        filter2.itemInfo = "คะแนนมากสุด"
        
        let filter3 = self.storyboard?.instantiateViewControllerWithIdentifier("ProductFilterPageViewController") as! ProductFilterPageViewController
        filter3.itemInfo = "ยอดนิยม"
        
        let filter4 = self.storyboard?.instantiateViewControllerWithIdentifier("ProductFilterPageViewController") as! ProductFilterPageViewController
        filter4.itemInfo = "ระยะทาง"
        
        return [filter1,filter2,filter3,filter4]
    }
    
    
    @IBAction func categoriesButtonAction(sender: AnyObject) {
        let dropdownView = storyboard!.instantiateViewControllerWithIdentifier("ProductDropDownViewController") as! UINavigationController
        
        
        presentViewController(dropdownView, animated: true, completion: nil)
    }
    
    
    
    @IBAction func hamburgerButtonAction(sender: AnyObject) {
        toggleLeftHamburger()
    }
    
    //
    //    func toggleDropDown(){
    //        let duration = 0.24
    //        if dopdownView.hidden {
    //            UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseIn, animations: {
    //                self.dopdownView.hidden =  !self.dopdownView.hidden
    //                self.dopdownView.layer.zPosition = 1
    //                self.dopdownView.alpha = 1
    //                }, completion: {(a) in
    //            })
    //
    //
    //        }
    //        else{
    //            UIView.animateWithDuration(duration, delay:0, options: .CurveEaseIn, animations: {
    //                self.dopdownView.alpha = 0
    //                }, completion: { (r) in
    //                    self.dopdownView.hidden =  !self.dopdownView.hidden
    //                    self.dopdownView.layer.zPosition = 0
    //                }
    //            )
    //        }
    //    }
    
    
    
    /*
     MARK: - Navigation
     
     In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     Get the new view controller using segue.destinationViewController.
     Pass the selected object to the new view controller.
     }
     */
    
}
