//
//  ViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/5/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTransparent()
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func setNavigationTransparent(){
        let navigationBar = navigationController!.navigationBar
        navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationBar.shadowImage = UIImage()
        navigationBar.translucent = true
    }
}

