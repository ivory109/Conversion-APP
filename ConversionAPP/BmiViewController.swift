import UIKit

class BmiViewController: UIViewController {
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var bmiImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let alertController = UIAlertController(title: "提示", message: "輸入身高", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "確認", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func checkBmiButton(_ sender: UIButton) {
        let height = Double(heightTextField.text!)
        let weight = Double(weightTextField.text!)
        
        if height != nil, weight != nil {
            let heightMeter = height! / 100
            let bmi = weight! / ( heightMeter * heightMeter)
            bmiLabel.text = String(format: "%.1f", bmi)
            
            if bmi < 18.5 {
                bmiImageView.image = UIImage(named: "Underweight")
            }else if bmi < 24 {
                bmiImageView.image = UIImage(named: "Healthy")
            }else if bmi < 27{
                bmiImageView.image = UIImage(named: "Overweight")
            }else{
                bmiImageView.image = UIImage(named: "Fat")
            }
        }
        //讓畫面結束編輯(鍵盤下降)
        view.endEditing(true)
    }
    
    //按下重置按鈕後
    @IBAction func resetButton(_ sender: UIButton) {
        heightTextField.text = ""
        weightTextField.text = ""
        bmiLabel.text = ""
        bmiImageView.image = nil
    }
}
