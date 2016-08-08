//
//  UIView.swift
//  SiamPiwat
//
//  Created by o.c on 3/2/2559 BE.
//  Copyright © 2559 o.c. All rights reserved.
//

import UIKit

@IBDesignable extension UIView {
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.CGColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(CGColor:color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}

extension UIDevice {
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .Phone
    }
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case Unknown
    }
    
    var screenType: ScreenType? {
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
            return nil
        }
    }
    
}

