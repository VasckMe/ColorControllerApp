//
//  UIViewControllerExtension.swift
//  ColorControllerApp
//
//  Created by Apple Macbook Pro 13 on 11.08.22.
//

import Foundation
import UIKit

extension UIViewController {
    func getModelFromUIColor(uiColor: UIColor) -> ColorModel? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1
        
        uiColor.getRed(&red,
                             green: &green,
                             blue: &blue,
                             alpha: &alpha)
        let redInt = Int(red * 255)
        let greenInt = Int(green * 255)
        let blueInt = Int(blue * 255)
        let alphaInt = Int(alpha * 100)

        let colorModel = ColorModel(red: redInt,
                               green: greenInt,
                               blue: blueInt,
                               alpha: alphaInt)
        return colorModel
    }
}
