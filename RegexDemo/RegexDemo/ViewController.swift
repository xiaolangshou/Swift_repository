//
//  ViewController.swift
//  RegexDemo
//
//  Created by lian shan on 2021/5/31.
//

import UIKit

class ViewController: UIViewController {

    let numTF = UITextField.init(frame: CGRect.init(x: 30, y: 50, width: 400, height: 40))

    let cvvTF = UITextField.init(frame: CGRect.init(x: 30, y: 100, width: 200, height: 90))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(numTF)
        numTF.backgroundColor = UIColor.lightGray
        numTF.keyboardType = .numberPad

        view.addSubview(cvvTF)
        cvvTF.backgroundColor = UIColor.cyan
        cvvTF.delegate = self
//        cvvTF.keyboardType = .numberPad
    }
}


extension ViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        guard let text = textField.text else { return true }

        var regex = "^([0-9]\\d{2})?$"
        let cNo = numTF.text?.replacingOccurrences(of: " ", with: "")
        if cNo != nil && cNo != "" {
            if cNo!.count >= 5 {
                regex = "^([0-9]\\d{3})?$"
            } else {
                regex = "^([0-9]\\d{2})?$"
            }
        }
        let result = Regexs.isValid(text: text,
                       replacementString: string,
                       regex: regex,
                       range: range)
        return result
    }

//    func textFieldDidEndEditing(_ textField: UITextField) {
//        guard let text = textField.text else { return }
//
//        var regex = "^([0-9]\\d{2})?$"
//        let cNo = numTF.text?.replacingOccurrences(of: " ", with: "")
//        if cNo != nil && cNo != "" {
//            if cNo!.count >= 5 {
//                regex = "^([0-9]\\d{3})?$"
//            } else {
//                regex = "^([0-9]\\d{2})?$"
//            }
//        }
//        let result = Regexs.isValidFinal(str: text, expression: regex)
//        print(result)
//    }
}
