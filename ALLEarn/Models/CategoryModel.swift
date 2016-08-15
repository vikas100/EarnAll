//
//  CategoryModel.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/15/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class CategoryModel: BaseModel {
    var id = ""
    var name = ""
    
    override init(){
        super.init()
    }
    
    required init(source: NSDictionary) {
        super.init(source: source)
        if let item = source["categoryId"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                id =  item as! String
            }
        }
        if let item = source["name"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                name =  item as! String
            }
        }
    }
}
