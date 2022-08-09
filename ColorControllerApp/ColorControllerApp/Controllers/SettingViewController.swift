//
//  SettingViewController.swift
//  ColorControllerApp
//
//  Created by Apple Macbook Pro 13 on 9.08.22.
//

import UIKit

class SettingViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var customPreview: UIView!
    @IBOutlet private weak var blueSlider: UISlider!
    @IBOutlet private weak var alphaSlider: UISlider!
    @IBOutlet private weak var alphaTextField: UITextField!
    
    @IBOutlet private weak var redTextFieldRGB: UITextField!
    @IBOutlet private weak var greenTextFieldRGB: UITextField!
    @IBOutlet private weak var blueTextFieldRGB: UITextField!
    @IBOutlet private weak var hexColorTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: IBActions
    @IBAction private func redSliderAction() {
        
    }
    @IBAction private func redTextFieldAction() {
    }
    @IBAction private func greenSliderAction() {
    }
    @IBAction private func greenTextFieldAction() {
    }
    
    @IBAction private func blueSliderAction() {
    }
    @IBAction private func blueTextFieldAction() {
    }
    @IBAction private func hexColorTextFieldAction() {
    }
    @IBAction private func alphaSliderAction() {
    }
    @IBAction private func alphaTextFieldAction() {
    }
    @IBAction private func doneButtonAction() {
    }
    
    // MARK: Functions
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
