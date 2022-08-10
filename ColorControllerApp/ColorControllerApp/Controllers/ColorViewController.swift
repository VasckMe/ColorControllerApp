//
//  ColorViewController.swift
//  ColorControllerApp
//
//  Created by Apple Macbook Pro 13 on 9.08.22.
//

import UIKit

// MARK: Protocol

protocol SetViewBackground {
    func setViewBackground(colorModel: ColorModel)
}

// MARK: Class

class ColorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: IBActions
    @IBAction private func changeBCAction() {
        performSegue(withIdentifier: "GoToSettingVC", sender: nil)
    }
    
    // MARK: Functions

    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingVC = segue.destination as? SettingViewController,
           segue.identifier == "GoToSettingVC"
        {
            if let backColor = view.backgroundColor,
               let colorModel = getModelFromUIColor(uiColor: backColor) {
                settingVC.clrModel = colorModel
            }
            settingVC.delegate = self
        }
    }
}

// MARK: Extension

extension ColorViewController: SetViewBackground {
    func setViewBackground(colorModel: ColorModel) {
        let red = CGFloat(Float(colorModel.red) / 255)
        let green = CGFloat(Float(colorModel.green) / 255)
        let blue = CGFloat(Float(colorModel.blue) / 255)
        let alpha = CGFloat(Float(colorModel.alpha) / 100)
        let newColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        view.backgroundColor = newColor
    }
}

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
