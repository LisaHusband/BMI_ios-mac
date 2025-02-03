//
//  ViewController.swift
//  BMI
//
//  Created by 陈宗 on 2025/1/30.
//

import UIKit

class ViewController: UIViewController {

    // 连接到UI控件
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化界面设置
        resultLabel.text = "Enter your details and calculate BMI"
    }

    // 计算BMI的按钮点击事件
    @IBAction func calculateBMI(_ sender: UIButton) {
        // 获取输入的体重和身高
        guard let weightText = weightTextField.text, !weightText.isEmpty,
              let heightText = heightTextField.text, !heightText.isEmpty,
              let weight = Double(weightText), let height = Double(heightText), height > 0 else {
            resultLabel.text = "Please enter valid numbers for weight and height."
            return
        }
        
        // 计算BMI
        let bmi = weight / (height * height)
        
        // 显示BMI结果
        resultLabel.text = "Your BMI is: \(String(format: "%.2f", bmi))"
        
        // 根据BMI值显示健康状态
        let status = getBMIStatus(bmi: bmi)
        resultLabel.text! += "\nStatus: \(status)"
    }
    
    // 根据BMI值获取健康状态
    func getBMIStatus(bmi: Double) -> String {
        switch bmi {
        case ..<18.5:
            return "Underweight"
        case 18.5..<24.9:
            return "Normal weight"
        case 25..<29.9:
            return "Overweight"
        default:
            return "Obesity"
        }
    }
}


