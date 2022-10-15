//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Howe on 2022/4/5.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var hightField: UITextField! // 輸入數值用.
    @IBOutlet weak var weightField: UITextField! // 輸入數值用.
    @IBOutlet weak var BMILabel: UILabel! // 顯示數值用.
    
    @IBOutlet weak var averageText: UITextView!
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // 對 view 任何一處 tap 時鍵盤退回.
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        hightField.delegate = self // 對應鍵盤 tap return 時 鍵盤會退回.
        weightField.delegate = self // 對應鍵盤 tap return 時 鍵盤會退回.
        
        BMILabel.text = "你的BMI是～" // APP 開啟時會先顯示此段.
      
    }
    // 做 鍵盤點選 return 時會退回的 UITextFieldDelegate 的 func，需在 class 加上 UITextFieldDelegate 還有配合對應的 hightField.delegate = self 、weightField.delegate = self.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
    
    // 點擊後會開始針對 textField 拿到的數值做計算.
    @IBAction func calBMI(_ sender: Any) {
    
        // textField 的預設類型是 String，所以將它轉成數值的 Double 較方便且能有小數點較準確做計算.
        // 因為怕沒有輸入數值而導致錯誤所以加上 optional binding.
        if let hight = Double(hightField.text!), let weight = Double(weightField.text!){
        let bmi = weight / ((hight/100) * (hight/100))
        
            
        // 再將數值轉換為字串投回 Label，使用字串的 method (format: String, arguments: [CVarArg])，並將顯示數字控制在小數點第二位 ( %.2 )
        BMILabel.text = String(format: "您的 BMI 為%.2f", bmi)
        
            averageText.text = """
男性BMI正常值落在17.4-23.3
女性BMI正常值落在17.1-22.7
"""
            
    }

    
}
    
}

