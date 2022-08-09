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

    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingVC = segue.destination as? SettingViewController,
           segue.identifier == "GoToSettingVC"
        {
            var green: CGFloat = 0
            var red: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            view.backgroundColor?.getRed(&red,
                                 green: &green,
                                 blue: &blue,
                                 alpha: &alpha)
            let model = ColorModel(red: red,
                                   green: green,
                                   blue: blue,
                                   alpha: alpha)
            settingVC.clrModel = model
            settingVC.delegate = self
        }
    }
}

// MARK: Extension

extension ColorViewController: SetViewBackground {
    func setViewBackground(colorModel: ColorModel) {
        let red = colorModel.red
        let green = colorModel.green
        let blue = colorModel.blue
        let alpha = colorModel.alpha
        let newColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        view.backgroundColor = newColor
    }
}
