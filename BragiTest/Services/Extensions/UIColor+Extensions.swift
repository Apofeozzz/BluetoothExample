//
//  UIColor+Extensions.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 06.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        
        return UIColor(displayP3Red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
        
    }
    
    static var alertBlue: UIColor {
        
        UIColor.rgb(red: 105, green: 146, blue: 195)
        
    }
    
    static var alertRed: UIColor {
        
        UIColor.rgb(red: 244, green: 86, blue: 86)
        
    }
    
    static var alertGreen: UIColor {
        
        UIColor.rgb(red: 33, green: 199, blue: 104)
        
    }
    
}
