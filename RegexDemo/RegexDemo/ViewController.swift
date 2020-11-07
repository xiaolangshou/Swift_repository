//
//  ViewController.swift
//  RegexDemo
//
//  Created by lian shan on 2020/11/1.
//

import UIKit

class ViewController: UIViewController {
    
    let floatTF = UITextField.init(frame: CGRect.init(x: 50, y: 100, width: 100, height: 50))
    let phoneNumTF = UITextField.init(frame: CGRect.init(x: 50, y: 160, width: 100, height: 50))
    let cardNumTF = UITextField.init(frame: CGRect.init(x: 50, y: 230, width: 100, height: 50))
    let expireTF = UITextField.init(frame: CGRect.init(x: 50, y: 300, width: 100, height: 50))
    let cvvTF = UITextField.init(frame: CGRect.init(x: 50, y: 360, width: 100, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(floatTF)
        view.addSubview(phoneNumTF)
        view.addSubview(cardNumTF)
        view.addSubview(expireTF)
        view.addSubview(cvvTF)
        
        floatTF.placeholder = "float"
        floatTF.borderStyle = .roundedRect
        floatTF.tag = 0
        floatTF.delegate = self
        
        phoneNumTF.placeholder = "phone num"
        phoneNumTF.borderStyle = .roundedRect
        phoneNumTF.tag = 1
        phoneNumTF.delegate = self
        
        cardNumTF.placeholder = "card num"
        cardNumTF.borderStyle = .roundedRect
        cardNumTF.tag = 2
        cardNumTF.delegate = self
        
        expireTF.placeholder = "expire date"
        expireTF.borderStyle = .roundedRect
        expireTF.tag = 3
        expireTF.delegate = self
        
        cvvTF.placeholder = "CVV"
        cvvTF.borderStyle = .roundedRect
        cvvTF.tag = 4
        cvvTF.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        guard let text = textField.text else { return true }
        
        //新输入的
        if string.count == 0 { return true }
        
        if textField.tag == 0 {
            let regex = "^\\-?([1-9]\\d*|0)(\\.\\d{0,2})?$"
            return isValid(text: text, replacementString: string, regex: regex, range: range)
        } else if textField.tag == 1 {
            return validateNumber(textField, range: range, string: string, limit: 11)
        } else if textField.tag == 2 {
            let regex = ""
        } else if textField.tag == 3 {
            // (0[1-9]|1[0-2])\/[0-9]{2}
        } else if textField.tag == 4 {
            
        } else {
            return false
        }

    }

    func isValid(text: String,
                 replacementString string: String,
                 regex: String,
                 range: NSRange) -> Bool
    {
        
        let checkStr = (text as NSString).replacingCharacters(in: range, with: string)
        
        //正则表达式（只支持两位小数）
        // "^\\-?([1-9]\\d*|0)(\\.\\d{0,2})?(\n)?$"
        let predicte = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicte.evaluate(with: checkStr)
    }
    
    // 11位数字
    func validateNumber(_ textField: UITextField,
                        range: NSRange,
                        string: String,
                        limit: Int = 11) -> Bool
    {
        
        guard let text = textField.text else { return false }

        let afterStr = (text as NSString).replacingCharacters(in: range, with: string)
        print(afterStr)
        
        ///限制长度
        if afterStr.count > limit {
            textField.text = (afterStr as NSString).substring(to: limit)
            return false
        }
        
        ///是否都是数字
        let set = CharacterSet(charactersIn: "0123456789").inverted
        let filteredStr = string.components(separatedBy: set).joined(separator: "")
        
        if filteredStr == string {
            return true
        }
        
        return false
    }

}


