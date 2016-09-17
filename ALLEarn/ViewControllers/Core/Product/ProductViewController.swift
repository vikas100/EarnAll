//
//  ProductViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/9/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class ProductViewController: ButtonBarPagerTabStripViewController , ProductDropDownDelegate{
    
    let filters = ["date","point","topchart","range"]
    let categories = ["0","31200000000000000000001","31200000000000000000002","31200000000000000000003","31200000000000000000004","31200000000000000000005","31200000000000000000006","31200000000000000000007","31200000000000000000008","31200000000000000000009"]
    
    var categoryCurrentIndex = 0
    
    override func viewDidLoad() {
        settingButtonBarPagerTab()
        super.viewDidLoad()
        setFontTitleBar()
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    }
    
    func settingButtonBarPagerTab(){
        
        //        buttonBarView.frame.origin.y = 64
        let hilightColor  = ColorManager.getMenuBlueHilight()
        let backgroudColor  =  ColorManager.getBlueNewPastel()
        
        
        //     UITabBar.appearance().ba
        settings.style.buttonBarBackgroundColor = backgroudColor
        settings.style.buttonBarItemBackgroundColor = backgroudColor
        settings.style.selectedBarBackgroundColor = .whiteColor()
        settings.style.buttonBarItemFont =  UIFont(name: "SukhumvitSet-SemiBold", size: 15)!//.boldSystemFontOfSize(14)
        //        settings.style.co
        settings.style.selectedBarHeight = 4.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = UIColor.whiteColor()
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        //        settings.style.buttonBarHeight = 20
        
        buttonBarView.frame = CGRect(x: 0, y: 0, width: buttonBarView.frame.width, height: 35)
        
        let treashow = buttonBarView.frame.height + 1
        containerView.frame = CGRect(x: 0, y: treashow, width: containerView.frame.width, height: (containerView.frame.height - treashow ) + 64)
        
        changeCurrentIndexProgressive = {  (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = hilightColor
            newCell?.label.textColor = .whiteColor()
        }
        
        
    }
    
    override func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let cagegory = categories[categoryCurrentIndex]
        let filter1 = self.storyboard?.instantiateViewControllerWithIdentifier("ProductFilterPageViewController") as! ProductFilterPageViewController
        filter1.itemInfo = "วันที่"
        filter1.filter = filters[0]
        filter1.category = cagegory
        
        let filter2 = self.storyboard?.instantiateViewControllerWithIdentifier("ProductFilterPageViewController") as! ProductFilterPageViewController
        filter2.itemInfo = "คะแนน"
        filter2.filter = filters[1]
        filter2.category = cagegory
        let filter3 = self.storyboard?.instantiateViewControllerWithIdentifier("ProductFilterPageViewController") as! ProductFilterPageViewController
        filter3.itemInfo = "ยอดนิยม"
        filter3.filter = filters[2]
        filter3.category = cagegory
        
        let filter4 = self.storyboard?.instantiateViewControllerWithIdentifier("ProductFilterPageViewController") as! ProductFilterPageViewController
        filter4.itemInfo = "ระยะทาง"
        filter4.filter = filters[3]
        filter4.category = cagegory
        
        return [filter1,filter2,filter3,filter4]
    }
    
    
    @IBAction func categoriesButtonAction(sender: AnyObject) {
        let dropdownNavigationView = storyboard!.instantiateViewControllerWithIdentifier("ProductDropDownViewController") as! UINavigationController
        let  dropdownViewController =   dropdownNavigationView.viewControllers[0] as! ProductDropDownViewController
        dropdownViewController.delegate = self
        presentViewController(dropdownNavigationView, animated: true, completion: nil)
    }
    
    
    //MARK: - DropDown Delegate
    func onDropDownSelected(index: Int, categoryName : String) {
        self.navigationController?.navigationBar.topItem!.title = categoryName
        categoryCurrentIndex = index
        moveToViewControllerAtIndex(0,animated: false)
        reloadPagerTabStripView()
    }
    
    //MARK: Button Action
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
