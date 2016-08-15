//
//  SystemManager.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/9/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit
import KVNProgress

class SystemManager {
    
    static func checkLogin()->Bool{
        return NSUserDefaults().boolForKey("login")
    }
    
    static func saveLogin(){
        NSUserDefaults().setBool(true, forKey: "login")
    }
    
    static func removeLogin(){
        NSUserDefaults().setBool(false, forKey: "login")
    }
    
    static func initUI(){
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSFontAttributeName: UIFont(name:"SukhumvitSet-Medium", size:11)!,
                NSForegroundColorAttributeName: ColorManager.getGrayText()],
            forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSFontAttributeName: UIFont(name:"SukhumvitSet-Medium", size:11)!,
                NSForegroundColorAttributeName: ColorManager.getBlueTextPastel()],
            forState: .Selected)
        
        setUpLoadingProgress()
    }
    
    static func setUpLoadingProgress(){
        let config = KVNProgressConfiguration()
        let color = ColorManager.getBluePastel()
        config.statusColor = color
        config.circleStrokeForegroundColor = color
        config.successColor = color
        KVNProgress.setConfiguration(config)
    }
}
