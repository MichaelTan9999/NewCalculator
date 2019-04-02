//
//  ViewController.swift
//  NewCalculator
//
//  Created by Michael Tan on 2019/3/20.
//  Copyright © 2019 Michael Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var StorageBox: UILabel!
    @IBOutlet weak var ExpressionBox: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonZero(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""// Already an error message.
        }
        else
        {
            ExpressionBox.text! += "0"
        }
    }
    
    @IBAction func ButtonOne(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "1"
        }
    }
    
    @IBAction func ButtonTwo(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "2"
        }
    }
    
    @IBAction func ButtonThree(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "3"
        }
    }
    
    @IBAction func ButtonFour(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "4"
        }
    }
    
    @IBAction func ButtonFive(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "5"
        }
    }
    
    @IBAction func ButtonSix(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "6"
        }
    }
    
    @IBAction func ButtonSeven(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "7"
        }
    }
    
    @IBAction func ButtonEight(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "8"
        }
    }
    
    @IBAction func ButtonNine(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "9"
        }
    }
    
    @IBAction func ButtonDot(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "."
        }
        
    }
    
    @IBAction func ButtonClearExpression(_ sender: Any) {
        ExpressionBox.text = ""
    }
    
    @IBAction func ButtonAllClear(_ sender: Any) {
        ExpressionBox.text = ""
        StorageBox.text = ""
    }
    
    @IBAction func ButtonBracketLeft(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "("
        }
    }
    
    @IBAction func ButtonBracketRight(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += ")"
        }
    }
    
    @IBAction func ButtonPower(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "^"
        }
    }
    
    @IBAction func ButtonSquare(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "Sqrt("
        }
    }
    
    @IBAction func ButtonPlus(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "+"
        }
    }
    
    @IBAction func ButtonMinor(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "-"
        }
    }
    
    @IBAction func ButtonMutiple(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "*"
        }
    }
    
    @IBAction func ButtonDivide(_ sender: Any) {
        
        if (ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""
        }
        else
        {
            ExpressionBox.text! += "/"
        }
    }
    
    @IBAction func ButtonEqual(_ sender: Any) {
        
        if (ExpressionBox.text == "" || ExpressionBox.text == "Wrong Expression.")
        {
            ExpressionBox.text = ""// Nothing or already an error message.
        }
        else
        {
            StorageBox.text = ExpressionBox.text
            
            print("The expression given to judge.cpp is \(String(describing: ExpressionBox.text!))")
            // This is to show the original expression hand on to judge.cpp
            
            let a: String = OC_model.judgement(ExpressionBox.text!)
            print("The result in Swift is \(a)\n");
            if (a != "Wrong Expression.")
            {
                let number = Double(a)
                ExpressionBox.text = "\(number!)"
            }
            else
            {
                ExpressionBox.text = a
            }
            
//            StorageBox.text = ExpressionBox.text
//            ExpressionBox.text = ""
        }
        /*
        let test = OC_model.judgement(ExpressionBox.text!)
        print(test!)
        print("123\0123")
 */
    }
}

