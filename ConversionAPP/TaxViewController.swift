import UIKit

class TaxViewController: UIViewController {
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    @IBOutlet weak var numberOfPeopleTextfield: UITextField!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var everyonePayLabel: UILabel!
    
    var price = Double(0)
    var tax = Double(0)
    var numberOfPeople = Double(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //同步更新priceTextField與totalPriceLabel
    @IBAction func onPriceTextChanged(_ sender: UITextField) {
        updateData()
    }
    
    //同步更新taxTextField與taxLabel
    @IBAction func onTaxTextChanged(_ sender: UITextField) {
        updateData()
    }
    
    //同步更新numberOfPeopleTextfield與everyonePayLabel
    @IBAction func onNumberOfPeopleChanged(_ sender: UITextField) {
        updateData()
    }
    
    //點擊空白處也能讓鍵盤收起
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //判斷以下的TextField.text，若為空就給0，否則就是所輸入的text
    func updateData() {
        if priceTextField.text == "" {
            price = Double(0)
        }else {
            price = Double(priceTextField.text!)!
        }
        
        if taxTextField.text == "" {
            tax = Double(0)
        }else {
            tax = Double(taxTextField.text!)!
        }
        
        if numberOfPeopleTextfield.text == "" {
            numberOfPeople = Double(0)
        }else {
            numberOfPeople = Double(numberOfPeopleTextfield.text!)!
        }
        
        //數學計算
        let finalTax = price * tax / Double(100)
        let finalTotal = price + finalTax
        let finalShare = finalTotal / numberOfPeople
        
        //將Double轉型成String並格式化
        totalPriceLabel.text = String(format: "%.0f", finalTotal)
        taxLabel.text = String(format: "%.1f", finalTax)
        everyonePayLabel.text = String(format: "%.1f", finalShare)
    }
    
    //按下清除按鈕
    @IBAction func resetButton(_ sender: UIButton) {
        priceTextField.text = ""
        taxTextField.text = ""
        numberOfPeopleTextfield.text = ""
        totalPriceLabel.text = "0"
        taxLabel.text = "0"
        everyonePayLabel.text = "0"
    }
}
