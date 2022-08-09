//
//  SettingViewController.swift
//  ColorControllerApp
//
//  Created by Apple Macbook Pro 13 on 9.08.22.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var customPreview: UIView!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redTextFieldRGB: UITextField!
    @IBOutlet weak var greenTextFieldRGB: UITextField!
    @IBOutlet weak var blueTextFieldRGB: UITextField!
    @IBOutlet weak var hexColorTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func redSliderAction() {
    }
    @IBAction func greenSliderAction() {
    }
    
    @IBAction func blueSliderAction() {
    }
    @IBAction func alphaSliderAction() {
    }
    @IBAction func doneButtonAction() {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
