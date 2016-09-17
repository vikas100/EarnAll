//
//  AppDelegate.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/5/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit
import MMDrawerController
import Branch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    static var shareWindow  : UIWindow?
    static var drawer : MMDrawerController?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        AppDelegate.shareWindow = window
        SystemManager.initUI()
        
        
        let branch: Branch = Branch.getInstance()
        
        
        branch.initSessionWithLaunchOptions(launchOptions, andRegisterDeepLinkHandler: { optParams, error in
            if error == nil, let params : AnyObject? = optParams {
                // params are the deep linked params associated with the link that the user clicked -> was re-directed to this app
                // params will be empty if no data found
                // ... insert custom logic here ...
                print("params: %@", params!.description)
            }
        })

        
        
        
        if (SystemManager.checkLogin())
        {
            self.window!.rootViewController =  AppDelegate.initDrawerMenu()
        }
        else
        {
            self.window!.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FirstPageViewController")
        }
       
        return true
    }
    
    
    // Respond to URI scheme links
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        // pass the url to the handle deep link call
        Branch.getInstance().handleDeepLink(url);
        
        // do other deep link routing for the Facebook SDK, Pinterest SDK, etc
        return true
    }
    
    // Respond to Universal Links
    func application(application: UIApplication, continueUserActivity userActivity: NSUserActivity, restorationHandler: ([AnyObject]?) -> Void) -> Bool {
        // pass the url to the handle deep link call
        
        return Branch.getInstance().continueUserActivity(userActivity)
    }

    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
    static func initDrawerMenu() ->MMDrawerController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let leftView = storyboard.instantiateViewControllerWithIdentifier("LeftMenu")
        let main = storyboard.instantiateViewControllerWithIdentifier("LandingPageController")
        let controller = MMDrawerController(centerViewController: main, leftDrawerViewController:leftView)
        
        controller.showsShadow = true
        controller.maximumRightDrawerWidth = 260
        controller.openDrawerGestureModeMask = MMOpenDrawerGestureMode.BezelPanningCenterView
        controller.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.All
        AppDelegate.drawer = controller
        return controller
    }
    
    
}

