//
//  StatisticModel.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/15/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class StatisticModel: BaseModel {
    var rating : CGFloat = 0
    var usage = 0
    var view = 0
    var donate = 0
    
    override init(){
        super.init()
    }
    
    required init(source: NSDictionary) {
        super.init(source: source)
        if let item = source["rating"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                rating = item as! CGFloat
            }
        }
        if let item = source["usage"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                usage = item as! Int
            }
        }
        if let item = source["view"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                view = item as! Int
            }
        }
        if let item = source["donate"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                donate = item as! Int
            }
        }
    }
}
