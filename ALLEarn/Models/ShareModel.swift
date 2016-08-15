//
//  ShareModel.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/15/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class ShareModel: BaseModel {
  var link = 0
    var email = 0
    var twitter = 0
    var facebook = 0
    
    
    override init(){
        super.init()
    }
    
    required init(source: NSDictionary) {
        super.init(source: source)
        if let item = source["link"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                link = item as! Int
            }
        }
        if let item = source["email"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                email = item as! Int
            }
        }
        if let item = source["twitter"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                twitter = item as! Int
            }
        }
        if let item = source["facebook"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                facebook = item as! Int
            }
        }
        
    }
}
