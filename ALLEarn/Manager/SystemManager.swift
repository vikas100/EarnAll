//
//  SystemManager.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/9/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

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
    
}
