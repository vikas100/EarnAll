//
//  Utils.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/12/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class Utils: NSObject {
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case Unknown
    }
    static func checkSize()-> ScreenType?{
        var iPhone: Bool {
            return UIDevice().userInterfaceIdiom == .Phone
        }
        
        guard iPhone else { return nil }
        switch UIScreen.mainScreen().nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 2208:
            return .iPhone6Plus
        default:
            return .iPhone6
            
        }
    }
    
    static  func convertNumberToStringCurrency(number:Double)->String {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        let result = numberFormatter.stringFromNumber(number)!
        var stringResult = ""
        if( result.containsString("THB"))
        {
            let index = result.startIndex.advancedBy(3)
            stringResult = result.substringFromIndex(index)
        }
        else {
            let index = result.startIndex.advancedBy(1)
            stringResult = result.substringFromIndex(index)
        }
        let value = stringResult.componentsSeparatedByString(".")
        return value[0]
    }
}

