//
//  MainUITabBarController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/11/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class MainUITabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        for item in tabBar.items! {
            item.image = item.image?.imageWithRenderingMode(.AlwaysOriginal)
            item.selectedImage  = item.image?.imageWithRenderingMode(.Automatic)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
