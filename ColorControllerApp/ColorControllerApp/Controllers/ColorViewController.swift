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

    @IBAction private func changeBCAction() {}

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}

// MARK: Extension

extension ColorViewController: SetViewBackground {
    func setViewBackground(colorModel: ColorModel) {
        let red = CGFloat(colorModel.red)
        let green = CGFloat(colorModel.green)
        let blue = CGFloat(colorModel.blue)
        let alpha = CGFloat(colorModel.alpha)
        let newColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        view.backgroundColor = newColor
    }
}
