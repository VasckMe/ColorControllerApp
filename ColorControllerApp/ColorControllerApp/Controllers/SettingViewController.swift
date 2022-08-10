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
    
    @IBOutlet private weak var doneButtonOutlet: UIButton!

    // MARK: Properties

    var delegate: SetViewBackground?
    var clrModel: ColorModel?
    
    private var red: Int = 0 {
        didSet {
            ColorController()
            setMinMaxSliderColor()
            checkModels()
        }
    }
    private var green: Int = 0 {
        didSet {
            ColorController()
            setMinMaxSliderColor()
            checkModels()
        }
    }
    private var blue: Int = 0 {
        didSet {
            ColorController()
            setMinMaxSliderColor()
            checkModels()
        }
    }
    private var alpha: Int = 1 {
        didSet {
            ColorController()
            setMinMaxSliderColor()
            checkModels()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor()
    }
    // MARK: IBActions
    @IBAction private func redSliderAction() {
        redTextFieldRGB.text = String(Int(redSlider.value))
        red = Int(redSlider.value)
    }

    @IBAction private func redTextFieldAction() {
        if
            let text = redTextFieldRGB.text,
           
            let number = Float(text)
        {
            redSlider.value = number
            red = Int(number)
        }
    }

    @IBAction private func greenSliderAction() {
        greenTextFieldRGB.text = String(Int(greenSlider.value))
        green = Int(greenSlider.value)
    }

    @IBAction private func greenTextFieldAction() {
        if
            let text = greenTextFieldRGB.text,
            let number = Float(text)
        {
            greenSlider.value = number
            green = Int(number)
        }
    }

    @IBAction private func blueSliderAction() {
        blueTextFieldRGB.text = String(Int(blueSlider.value))
        blue = Int(blueSlider.value)
    }

    @IBAction private func blueTextFieldAction() {
        if
            let text = blueTextFieldRGB.text,
            let number = Float(text)
        {
            blueSlider.value = number
            blue = Int(number)
        }
    }
    
    @IBAction private func hexColorTextFieldAction() {
        if
            let hex = hexColorTextField.text,
            let color = UIColor(hex: hex),
            let model = getModelFromUIColor(uiColor: color)
        {
            red = model.red
            green = model.green
            blue = model.blue
            alpha = model.alpha
        }
    }
    
    @IBAction private func alphaSliderAction() {
        alphaTextField.text = String(Int(alphaSlider.value))
        alpha = Int(alphaSlider.value)
    }

    @IBAction private func alphaTextFieldAction() {
        if let text = alphaTextField.text,
           let number = Float(text)
        {
            alphaSlider.value = number
            alpha = Int(number)
        }
    }

    @IBAction private func doneButtonAction() {
        let colorModel = ColorModel(red: red, green: green, blue: blue, alpha: alpha)
        
        delegate?.setViewBackground(colorModel: colorModel)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Functions
    
    private func ColorController() {
        let redCGFloat = CGFloat(Float(red) / 255)
        let greenCGFloat = CGFloat(Float(green) / 255)
        let blueCGFloat = CGFloat(Float(blue) / 255)
        let alphaCGFloat = CGFloat(Float(alpha) / 100)
        
        let color = UIColor(red: redCGFloat, green: greenCGFloat, blue: blueCGFloat, alpha: alphaCGFloat)
        let model = ColorModel(red: red, green: green, blue: blue, alpha: alpha)
        hexColorTextField.text = getHexColor(model: model)
        customPreview.backgroundColor = color
    }
    
    private func setMinMaxSliderColor() {
        let redCG = CGFloat(Float(red) / 255)
        let greenCG = CGFloat(Float(green) / 255)
        let blueCG = CGFloat(Float(blue) / 255)
        let alphaCG = CGFloat(Float(alpha) / 100)
        
        redSlider.minimumTrackTintColor = UIColor(red: 0, green: greenCG, blue: blueCG, alpha: alphaCG)
        redSlider.maximumTrackTintColor = UIColor(red: 1, green: greenCG, blue: blueCG, alpha: alphaCG)
        redSlider.thumbTintColor = UIColor(red: redCG, green: greenCG, blue: blueCG, alpha: alphaCG)

        greenSlider.minimumTrackTintColor = UIColor(red: redCG, green: 0, blue: blueCG, alpha: alphaCG)
        greenSlider.maximumTrackTintColor = UIColor(red: redCG, green: 1, blue: blueCG, alpha: alphaCG)
        greenSlider.thumbTintColor = UIColor(red: redCG, green: greenCG, blue: blueCG, alpha: alphaCG)
        
        blueSlider.minimumTrackTintColor = UIColor(red: redCG, green: greenCG, blue: 0, alpha: alphaCG)
        blueSlider.maximumTrackTintColor = UIColor(red: redCG, green: greenCG, blue: 1, alpha: alphaCG)
        blueSlider.thumbTintColor = UIColor(red: redCG, green: greenCG, blue: blueCG, alpha: alphaCG)
    }
    
    private func checkModels() {
        let newColorModel = ColorModel(red: red, green: green, blue: blue, alpha: alpha)
        
        doneButtonOutlet.isEnabled = clrModel != newColorModel
    }
    
    private func setupColor() {
        if let colorModel = clrModel {
            red = colorModel.red
            green = colorModel.green
            blue = colorModel.blue
            alpha = colorModel.alpha

            redSlider.value = Float(red)
            greenSlider.value = Float(green)
            blueSlider.value = Float(blue)
            alphaSlider.value = Float(alpha)
            
            hexColorTextField.text = getHexColor(model: colorModel)
            redTextFieldRGB.text = String(red)
            greenTextFieldRGB.text = String(green)
            blueTextFieldRGB.text = String(blue)
            alphaTextField.text = String(alpha)
        }
    }
    
    private func getHexColor(model: ColorModel) -> String {
        let red = model.red
        let green = model.green
        let blue = model.blue
        
        let hexValue = String(format: "%02X", Int(red)) + String(format: "%02X", Int(green)) + String(format: "%02X", Int(blue))
        return hexValue
    }
}


extension UIColor {
    convenience init?(hex: String) {
        var hexSanitilized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitilized = hexSanitilized.replacingOccurrences(of: "#", with: "")
    
        let length = hexSanitilized.count
        var rgb: UInt64 = 0
    
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
    
        guard Scanner(string: hexSanitilized).scanHexInt64(&rgb) else { return nil }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255
        } else {
            return nil
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
