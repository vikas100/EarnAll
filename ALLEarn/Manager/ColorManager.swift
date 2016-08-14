//
//  ColorManager.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/11/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class ColorManager: NSObject {

    static func getDarkGreen()->UIColor{
        return UIColor(red: 21/255, green: 34/255, blue: 9/255, alpha: 1)
    }
    
    static func getGreen()->UIColor{
        return UIColor(red: 80/255, green: 157/255, blue: 10/255, alpha: 0.5)
    }
    
    static func getGreenPastel()->UIColor{
        return UIColor(red: 152/255, green: 195/255, blue: 59/255, alpha: 0.5)
    }
    
    static func getBluePastel()->UIColor{
        return UIColor(red: 40/255, green: 133/255, blue: 195/255, alpha: 0.5)
    }
    
    static func getBlueNewPastel()->UIColor{
        return UIColor(red: 54/255, green: 129/255, blue: 194/255, alpha: 1)
    }

    static func getBlueTextPastel()->UIColor{
        return UIColor(red: 40/255, green: 133/255, blue: 195/255, alpha: 1)
    }
    
    static func getGrayText()->UIColor{
        return UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
    }
    
//    static func getBlueTextPastel()->UIColor{
//        return UIColor(red: 40/255, green: 119/255, blue: 189/255, alpha: 1)
//    }
}
