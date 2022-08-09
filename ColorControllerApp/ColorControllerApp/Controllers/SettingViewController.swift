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
    
    // MARK: Properties
    var delegate: SetViewBackground?
    var clrModel: ColorModel?
    
    private var red: CGFloat = 0 {
        didSet {
            ColorController()
            setMinMaxSliderColor()
        }
    }
    private var green: CGFloat = 0 {
        didSet {
            ColorController()
            setMinMaxSliderColor()
        }
    }
    private var blue: CGFloat = 0 {
        didSet {
            ColorController()
            setMinMaxSliderColor()
        }
    }
    private var alpha: CGFloat = 1 {
        didSet {
            ColorController()
            setMinMaxSliderColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupColor()
        // Do any additional setup after loading the view.
    }
    // MARK: IBActions
    @IBAction private func redSliderAction() {
        redTextFieldRGB.text = String(Int(redSlider.value))
        red = CGFloat(redSlider.value / 255)
    }
    @IBAction private func redTextFieldAction() {
        if let text = redTextFieldRGB.text,
           let number = Float(text) {
            redSlider.value = number
            red = CGFloat(number / 255)
        }
    }
    @IBAction private func greenSliderAction() {
        greenTextFieldRGB.text = String(Int(greenSlider.value))
        green = CGFloat(greenSlider.value / 255)
    }
    @IBAction private func greenTextFieldAction() {
        if let text = greenTextFieldRGB.text,
           let number = Float(text) {
            greenSlider.value = number
            green = CGFloat(number / 255)
        }
    }
    @IBAction private func blueSliderAction() {
        blueTextFieldRGB.text = String(Int(blueSlider.value))
        blue = CGFloat(blueSlider.value / 255)
    }
    @IBAction private func blueTextFieldAction() {
        if let text = blueTextFieldRGB.text,
           let number = Float(text) {
            blueSlider.value = number
            blue = CGFloat(number / 255)
        }
    }
    
    @IBAction private func hexColorTextFieldAction() {
    }
    
    @IBAction private func alphaSliderAction() {
        alphaTextField.text = String(Int(alphaSlider.value))
        alpha = CGFloat(alphaSlider.value / 100)
    }
    @IBAction private func alphaTextFieldAction() {
        if let text = alphaTextField.text,
           let number = Float(text) {
            alphaSlider.value = number
            alpha = CGFloat(number / 100)
        }
    }
    @IBAction private func doneButtonAction() {
        let colorModel = ColorModel(red: red, green: green, blue: blue, alpha: alpha)
        
        delegate?.setViewBackground(colorModel: colorModel)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Functions
    
    private func ColorController() {
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        customPreview.backgroundColor = color
    }
    
    private func setMinMaxSliderColor() {
        redSlider.minimumTrackTintColor = UIColor(red: 0, green: green, blue: blue, alpha: alpha)
        redSlider.maximumTrackTintColor = UIColor(red: 1, green: green, blue: blue, alpha: alpha)
        redSlider.thumbTintColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)

        greenSlider.minimumTrackTintColor = UIColor(red: red, green: 0, blue: blue, alpha: alpha)
        greenSlider.maximumTrackTintColor = UIColor(red: red, green: 1, blue: blue, alpha: alpha)
        greenSlider.thumbTintColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        blueSlider.minimumTrackTintColor = UIColor(red: red, green: green, blue: 0, alpha: alpha)
        blueSlider.maximumTrackTintColor = UIColor(red: red, green: green, blue: 1, alpha: alpha)
        blueSlider.thumbTintColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private func setupColor() {
        if let colorModel = clrModel {
            red = colorModel.red
            green = colorModel.green
            blue = colorModel.blue
            alpha = colorModel.alpha
            
            redSlider.value = Float(red*255)
            greenSlider.value = Float(green*255)
            blueSlider.value = Float(blue*255)
            alphaSlider.value = Float(alpha*100)
            
            redTextFieldRGB.text = String(Int(red * 255))
            greenTextFieldRGB.text = String(Int(green * 255))
            blueTextFieldRGB.text = String(Int(blue * 255))
            alphaTextField.text = String(Int(alpha * 100))
        }
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
