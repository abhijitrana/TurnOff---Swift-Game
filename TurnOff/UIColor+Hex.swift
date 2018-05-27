//
//  Extension+UIColor.swift
//  TurnOff
//
//  Created by Abhijit Rana on 06/04/18.
//

import Foundation
import UIKit

extension UIColor {
    
    
    class var bgColor : UIColor {
        get {
            return UIColor.hexStringToUIColor(hex: "039BE5")
        }
    }
    
    class var containerColor : UIColor {
        get {
            return UIColor.hexStringToUIColor(hex: "81D4FA")
        }
    }
    
    class var onColor : UIColor {
        get {
            return UIColor.hexStringToUIColor(hex: "E1F5FE")
        }
    }
    
    class var offColor : UIColor {
        get {
            return UIColor.hexStringToUIColor(hex: "FF8A65")
        }
    }
    
    
    class func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
