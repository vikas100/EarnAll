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
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    }
    
    func settingButtonBarPagerTab(){
        let hilightColor  = ColorManager.getMenuBlueHilight()
        let backgroudColor  =  ColorManager.getBlueNewPastel()
        settings.style.buttonBarBackgroundColor = backgroudColor
        settings.style.buttonBarItemBackgroundColor = backgroudColor
        settings.style.selectedBarBackgroundColor = .whiteColor()
        settings.style.buttonBarItemFont =  UIFont(name: "SukhumvitSet-SemiBold", size: 15)!
        settings.style.selectedBarHeight = 4.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = UIColor.whiteColor()
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        buttonBarView.frame = CGRect(x: 0, y: 0, width: buttonBarView.frame.width, height: 35)
        
        let treashow = buttonBarView.frame.height
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
        
        let filter2 = self.storyboard?.instantiateViewControllerWithIdentifier("ScanQRViewController") as! ScanQRViewController
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
