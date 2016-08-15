//
//  PictureModel.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/15/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class PictureModel: BaseModel {
    var thumb = ""
    var detail = ""
    var id = ""
    
    override init(){
        super.init()
    }
    
    required init(source: NSDictionary) {
        super.init(source: source)
        if let item = source["thumb"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                thumb =  item as! String
            }
        }
        if let item = source["detail"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                detail =  item as! String
            }
        }
    }
}
