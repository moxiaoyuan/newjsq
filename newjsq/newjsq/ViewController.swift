//
//  ViewController.swift
//  newjsq
//
//  Created by hqq1 on 16/4/18.
//  Copyright © 2016年 hqq1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var operand1:String = ""//缓存的字符串
    var operand2:String = ""
    var operator1:String = ""//记录操作符
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func Del(sender: UIButton) {
            var str = ""
            var n = ""
            var strl = 0
            str = resultLabel.text!
            strl = str.characters.count
            n = (str as NSString).substringWithRange(NSMakeRange(0,strl-1))
            //n = (str as NSString).substringFromIndex(strl)
            resultLabel.text = n
        if n == ""{
            if operator1 != ""{
                operator1 = ""
            }else{
            operand1 = ""}
        }else{
            operand1 = n}
    }
    
    @IBAction func didClicked(sender: UIButton) {
        //println("\(sender.currentTitle)")判断是哪个button
        let value = sender.currentTitle//提取每次取的值
        if value == "+"||value == "-"||value == "x"||value == "/"
            //判断是运算符还是数字
        {
            operator1 = value!
            resultLabel.text="\(operator1)"
            return
        }
        else if value == "C"{
            operator1 = ""
            operand1 = ""
            operand2 = ""
            resultLabel.text = ""
            return
        }
        
            
        else if value == "="{
            var result = 0.0
            switch operator1{
                case "+":
                    result=Double(operand1)! + Double(operand2)!
                resultLabel.text = "\(result)"
                case "-":
                    result=Double(operand1)! - Double(operand2)!
                resultLabel.text = "\(result)"
                case "x":
                    result=Double(operand1)! * Double(operand2)!
                resultLabel.text = "\(result)"
                case "/":
                     if operand2 == "0"
                     {
                        resultLabel.text = "被除数不能为0"
                        break
                     }
                        result=Double(operand1)! / Double(operand2)!
                resultLabel.text = "\(result)"
                default:
                resultLabel.text = "errol"
            }
            
            
            return
        }
            if operator1 == ""{
                operand1 = operand1 + value!
                resultLabel.text = operand1
            }
            else{
                operand2 = operand2 + value!
                resultLabel.text = operand2
            }
    }
}