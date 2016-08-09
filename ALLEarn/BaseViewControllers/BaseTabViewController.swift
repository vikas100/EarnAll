//
//  BaseTabViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/9/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class BaseTabViewController: UIViewController {

    func toggleLeftHamburger(){
        AppDelegate.drawer?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
}
