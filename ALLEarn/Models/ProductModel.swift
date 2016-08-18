//
//  ProductModel.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/15/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class ProductModel: BaseModel {
    var id = ""
    var percentDiscount = 0
    var title = ""
    var detail = ""
    var share = ShareModel()
    var statistic = StatisticModel()
    var category = CategoryModel()
    var image = PictureModel()
    var percentDonate = 0
    var business = BusinessModel()
    
    override init(){
        super.init()
    }
    
    required init(source: NSDictionary) {
        super.init(source: source)
        if let item = source["_id"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                id = String(item)
            }
        }
        if let item = source["percentDiscount"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                percentDiscount = item as! Int
            }
        }
        if let item = source["percentDonate"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                percentDonate = item as! Int
            }
        }
        if let item = source["name"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                title = item as! String
            }
        }
        if let item = source["detail"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                detail = item as! String
            }
        }
        if let item = source["shares"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                share = ShareModel(source: item as! NSDictionary)
            }
        }
        if let item = source["statistic"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                statistic = StatisticModel(source: item as! NSDictionary)
            }
        }
        if let item = source["category"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                category =  CategoryModel(source: item as! NSDictionary)
            }
        }
        if let item = source["business_id"]{
            if(!item.isMemberOfClass(NSNull.self))
            {
                business =  BusinessModel(source: item as! NSDictionary)
            }
        }
        if let item = source["pictures"] as? NSArray{
            if(!item.isMemberOfClass(NSNull.self))
            {
                if item.count > 0
                {
                    let dataItem = item[0]
                    image =  PictureModel(source: dataItem as! NSDictionary)
                }
            }
        }
        
    }
    
}