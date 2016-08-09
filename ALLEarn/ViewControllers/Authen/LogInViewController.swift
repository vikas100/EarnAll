//
//  LogInViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/5/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class LogInViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendActionButton(sender: AnyObject) {
        
        let controller =  UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LandingPageController")
        self.presentViewController(controller, animated: true, completion: {
            AppDelegate.shareWindow!.rootViewController =  controller
        })
    }
}
