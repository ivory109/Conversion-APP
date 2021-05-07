import UIKit

class ExchangeRateViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var twdTextField: UITextField!
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var krwTextField: UITextField!
    @IBOutlet weak var jpyTextField: UITextField!
    
    var twdNumber = Double(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "rateCurrent")
        twdTextField.keyboardType = .numberPad
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func onTwdChanged(_ sender: UITextField) {
        if twdTextField.text == "" {
            twdNumber = 0
        }else{
            twdNumber = Double(twdTextField.text!)!
            usdTextField.text = String(format: "%.4f", twdNumber * 0.0358)
            krwTextField.text = String(format: "%.4f", twdNumber * 40.1867)
            jpyTextField.text = String(format: "%.4f", twdNumber * 3.9118)
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        twdTextField.text = ""
        usdTextField.text = ""
        krwTextField.text = ""
        jpyTextField.text = ""
    }
}
