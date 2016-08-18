//
//  BusinessModel.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/18/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class BusinessModel: BaseModel {
    var thumb = ""
    var detail = ""
    var id = ""
    
    override init(){
        super.init()
    }
    
    required init(source: NSDictionary) {
        super.init(source: source)
        if let item = source["picture"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                if let value = item["thumb"]{
                    if(!value!.isMemberOfClass(NSNull.self))
                    {
                        thumb =  value as! String
                    }
                }
            }
        }
    }
}