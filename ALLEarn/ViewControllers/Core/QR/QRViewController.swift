//
//  QRViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/9/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class QRViewController : ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        settingButtonBarPagerTab()
        super.viewDidLoad()
        setFontTitleBar()
        // Do any additional setup after loading the view.
    }
    
    func settingButtonBarPagerTab(){
        
        buttonBarView.frame.origin.y = 64
        let hilightColor  = ColorManager.getDarkGreen()
        let backgroudColor  =  ColorManager.getGreen()
        
        
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
        
        let treashow = 64 + buttonBarView.frame.height
        containerView.frame = CGRect(x: 0, y: treashow, width: containerView.frame.width, height: containerView.frame.height - treashow)
        
        changeCurrentIndexProgressive = {  (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = hilightColor
            newCell?.label.textColor = .whiteColor()
            
        }
    }
    
    override func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let filter1 = self.storyboard?.instantiateViewControllerWithIdentifier("MyQRViewController") as! MyQRViewController
        filter1.itemInfo = "QR ของฉัน"
        
        let filter2 = self.storyboard?.instantiateViewControllerWithIdentifier("MyQRViewController") as! MyQRViewController
        filter2.itemInfo = "สแกน QR"
    return [filter1,filter2]
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
