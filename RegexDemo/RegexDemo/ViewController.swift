//
//  ViewController.swift
//  RegexDemo
//
//  Created by lian shan on 2020/10/28.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var loginBtn:UIButton!
    var textField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn = UIButton(frame: CGRect(x: 100, y: 150, width: 60, height: 40))
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = UIColor.lightGray
        loginBtn.isEnabled = false
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        view.addSubview(loginBtn)

        textField = UITextField(frame: CGRect(x: 100, y: 100, width: 200, height: 20))
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default//设置键盘类型为数字键盘
        view.addSubview(textField)
        textField.delegate = self
    }

    @objc func login(){
        print(#function)
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        guard textField.text != nil else {
            return true
        }
        
        //新输入的
        if string.count == 0 {
            return true
        }
        
        let str = textField.text
            let expression = "^((13\\d)|(14[5|7])|(15([0-3]|[5-9]))|(18[^14]))\\d{8}$"//"|"表示什么就不用说了吧，[5|7]表示满足其中任意一个即匹配，数量唯一，"[0-3]"则表示满足0到之间的数字即匹配，数量唯一，[^14]表示匹配除1和4以外的任意字符，这里包括了字母，所以建议弹出键盘类型为数字键盘

            let regex = try! NSRegularExpression(pattern: expression, options: .allowCommentsAndWhitespace)//生成NSRegularExpression实例

        let numberOfMatches = regex.numberOfMatches(in: str ?? "", options:.reportProgress, range: NSMakeRange(0, (str! as NSString).length))//获取匹配的个数

            if numberOfMatches != 0 {//如果匹配，则登录按钮生效，否则反之
                loginBtn.backgroundColor = UIColor.brown
                loginBtn.isEnabled = true
                
                return true
            }else{
                loginBtn.backgroundColor = UIColor.lightGray
                loginBtn.isEnabled = false
                
                return false
            }
    }
}

