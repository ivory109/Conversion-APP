import UIKit
import Foundation

class UnitViewController: UIViewController {
    //身高
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var meterLabel: UILabel!
    @IBOutlet weak var centimeterLabel: UILabel!
    
    //重量
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var kilogramLabel: UILabel!
    @IBOutlet weak var gramLabel: UILabel!
    
    //面積
    @IBOutlet weak var areaTextField: UITextField!
    @IBOutlet weak var squareKilometersLabel: UILabel!
    @IBOutlet weak var squareMetersLabel: UILabel!
    
    //時間
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    
    //先宣告出外部變數以利重複使用
    var height = Double(0)
    var weight = Double(0)
    var area = Double(0)
    var time = Double(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //空白處收起鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //身高換算
    @IBAction func onHeightChanged(_ sender: UITextField) {
        updateData()
        //公分
        let heightInCm = Measurement(value: height, unit: UnitLength.centimeters)
        centimeterLabel.text = heightInCm.description
        //公尺
        let heightInM = heightInCm.converted(to: .meters)
        meterLabel.text = heightInM.description
    }
    
    //重量換算
    @IBAction func onWeightChanged(_ sender: UITextField) {
        updateData()
        //公斤
        let weightInKg = Measurement(value: weight, unit: UnitMass.kilograms)
        kilogramLabel.text = weightInKg.description
        //公克
        let weightInG = weightInKg.converted(to: .grams)
        gramLabel.text = weightInG.description
    }
    
    //面積換算
    @IBAction func onAreaChanged(_ sender: UITextField) {
        updateData()
        //平方公里
        let areaInSquareKilometers = Measurement(value: area, unit: UnitArea.squareKilometers)
        squareKilometersLabel.text = areaInSquareKilometers.description
        //平方公尺
        let areaInSquareMeters = areaInSquareKilometers.converted(to: .squareMegameters)
        squareMetersLabel.text = areaInSquareMeters.description
    }
    
    //時間換算
    @IBAction func onTimeChanged(_ sender: UITextField) {
        updateData()
        //時
        let timeInHour = Measurement(value: time, unit: UnitDuration.hours)
        hourLabel.text = timeInHour.description
        //分
        let timeInMinute = timeInHour.converted(to: .minutes)
        minuteLabel.text = timeInMinute.description
    }
    
    //先判斷再執行同步換算
    func updateData() {
        if heightTextField.text == "" {
            height = Double(0)
        }else{
            height = Double(heightTextField.text!)!
        }
        
        if weightTextField.text == "" {
            weight = Double(0)
        }else{
            weight = Double(weightTextField.text!)!
        }
        
        if areaTextField.text == "" {
            area = Double(0)
        }else{
            area = Double(areaTextField.text!)!
        }
        
        if timeTextField.text == "" {
            time = Double(0)
        }else{
            time = Double(timeTextField.text!)!
        }
    }
    
    //Clear按鈕
    @IBAction func clearButton(_ sender: UIButton) {
        heightTextField.text = ""
        meterLabel.text = "0"
        centimeterLabel.text = "0"
        weightTextField.text = ""
        kilogramLabel.text = "0"
        gramLabel.text = "0"
        areaTextField.text = ""
        squareKilometersLabel.text = "0"
        squareMetersLabel.text = "0"
        timeTextField.text = ""
        hourLabel.text = "0"
        minuteLabel.text = "0"
    }
}
