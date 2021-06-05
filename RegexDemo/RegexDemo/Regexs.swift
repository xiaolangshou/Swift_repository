//
//  Regexs.swift
//  RegexDemo
//
//  Created by lian shan on 2021/5/31.
//

import Foundation
import UIKit

class Regexs {
    // Regex string
    static let VISA_BIN_REGEX = "^4\\d{5}"
    static let VISA_REGEX = "^4\\d{12,18}" // For VISA
    static let MASTERCARD_BIN_REGEX = "^5[1-5]\\d{4}" // For MASTER
    static let CARD_NAME_REGEX = "^\\d+$" // For name
    static let PHONE_REGEX = "^[1-9][0-9]{8,11}$" // For phone
    static let SMS_CODE_REGEX = "^\\d{6}$" // For sms code
    static let BCA_ID_REGEX = "^[a-zA-Z0-9]{8,12}$" //For bca id

    static func isValidFinal(str: String, expression: String) -> Bool {

        var regex: NSRegularExpression?
        do {
            regex = try NSRegularExpression.init(pattern: expression,
                                                 options: .allowCommentsAndWhitespace)
            let numberOfMatches = regex?.numberOfMatches(in: str,
                                                    options:.reportProgress,
                                                    range: NSMakeRange(0, str.count))//获取匹配的个数

            if numberOfMatches != 0 {//如果匹配，则登录按钮生效，否则反之
                return true
            } else {
                return false
            }
        } catch {
            return false
        }
    }

    static func isValid(text: String,
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

    // 16位数字
    static func validateNumber(_ textField: UITextField,
                        range: NSRange,
                        string: String,
                        limit: Int = 16) -> Bool
    {

        guard let text = textField.text else { return false }

        let afterStr = (text as NSString).replacingCharacters(in: range, with: string)

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

    /**
     * 是否是VISA，在卡是正确的情况下来判断
     * */
    public static func isVISABin(_ cardNumber: String?) -> Bool {
        guard cardNumber != nil && (cardNumber?.count ?? 0) > 0 else {
            return false
        }
        let isValid = Regexs.isValidFinal(str: cardNumber!, expression: VISA_BIN_REGEX)
        return isValid
    }

    /**
     * 是否是万事达，对卡号进行完全判断
     * */
    public static func isMASTERCARD(_ cardNumber: String?) -> Bool {
        guard cardNumber != nil && (cardNumber?.count ?? 0) > 0 else {
            return false
        }
        return Regexs.isMASTERCARDBin(cardNumber) && cardNumber!.count == 16 && CardCheckAlgorithm.checkCardNumber(cardNumber)
    }

    /**
     * 是否是万事达，在卡是正确的情况下来判断
     * @param cardNumber 字符串经过trim操作
     * */
    public static func isMASTERCARDBin(_ cardNumber: String?) -> Bool {
        guard cardNumber != nil && (cardNumber?.count ?? 0) > 0 else {
            return false
        }
        let trimmedCardNum = cardNumber!.trimmingCharacters(in: .whitespacesAndNewlines)
        var cardBin = ""
        if trimmedCardNum.count >= 6 {
            cardBin = (trimmedCardNum as NSString).substring(with:NSMakeRange(0, 6))
        }
        let cardValue = Int(cardBin) ?? 0;
        if ((cardValue >= 222100 && cardValue <= 229236) ||
                        (cardValue >= 229240 && cardValue <= 272099)) {
            return true;
        }
        let isValid = Regexs.isValidFinal(str: cardBin, expression: MASTERCARD_BIN_REGEX)
        return isValid;
    }

    /**
     * 是否是JCB，对卡号进行完全判断
     * */
    public static func isJCB(_ cardNumber: String?) -> Bool {
        guard cardNumber != nil && (cardNumber?.count ?? 0) > 0 else {
            return false
        }
        return Regexs.isJCBBin(cardNumber)
                && (cardNumber!.count == 16 || cardNumber!.count == 19)
                && CardCheckAlgorithm.checkCardNumber(cardNumber)
    }

    /**
     * 是否是JCB，在卡是正确的情况下来判断
     * @param cardNumber 字符串经过trim操作
     * */
    public static func isJCBBin(_ cardNumber: String?) -> Bool {
        guard cardNumber != nil && (cardNumber?.count ?? 0) > 0 else {
            return false
        }

        var cardBin = ""
        let trimmedCardNum = cardNumber!.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedCardNum.count >= 6 {
            cardBin = (trimmedCardNum as NSString).substring(with:NSMakeRange(0, 6))
        }
        let cardValue = Int(cardBin) ?? 0
        if (cardValue >= 352800 && cardValue <= 358999) {
            return true
        }
        return false
    }

    /**
     * 对卡号进行完全判断
     * */
    public static func isAMEX(_ cardNumber: String?) -> Bool {
        guard cardNumber != nil && (cardNumber?.count ?? 0) > 0 else {
            return false
        }
        return Regexs.isAMEXBin(cardNumber)
                && (cardNumber!.count == 15)
                && CardCheckAlgorithm.checkCardNumber(cardNumber);
    }

    /**
     * 是否是AMEX，在卡是正确的情况下来判断
     * @param cardNumber 字符串经过trim操作
     * */
    public static func isAMEXBin(_ cardNumber: String?) -> Bool {
        guard cardNumber != nil && (cardNumber?.count ?? 0) > 0 else {
            return false
        }
        let trimmedCardNum = cardNumber!.trimmingCharacters(in: .whitespacesAndNewlines)
        var cardBin = ""
        if trimmedCardNum.count >= 2 {
            cardBin = (trimmedCardNum as NSString).substring(with:NSMakeRange(0, 2))
        }
        let cardValue = Int(cardBin) ?? 0;
        if (cardValue == 34 || cardValue == 37) {
            return true;
        }
        return false;
    }

    public static func isCardNameValid(_ cardName: String?) -> Bool  {
        guard cardName != nil && (cardName?.count ?? 0) > 0 else {
            return false
        }
        // 128 length limit
        if cardName!.count > 128 {
            return false
        }

        if cardName!.hasPrefix(" ") {
            return false
        }
        let trimmedCardName = cardName!.trimmingCharacters(in: .whitespacesAndNewlines)
        let isDigital = Regexs.isValidFinal(str: trimmedCardName, expression: CARD_NAME_REGEX)
        return !isDigital
    }

    /**
     * 是否是Phone NO，对电话号码进行完全判断
     * */
    public static func isPhoneNo(_ phoneNum: String?) -> Bool {
        guard phoneNum != nil && (phoneNum?.count ?? 0) > 0 else {
            return false
        }
        let isValid = Regexs.isValidFinal(str: phoneNum!, expression: PHONE_REGEX)

        return isValid
    }

    /**
     * 验证码是否正确
     * */
    public static func isSMSCode(_ smsCode: String?) -> Bool {
        guard smsCode != nil && (smsCode?.count ?? 0) > 0 else {
            return false
        }

        let isValid = Regexs.isValidFinal(str: smsCode!, expression: SMS_CODE_REGEX)

        return isValid
    }

}

class CardCheckAlgorithm {
    // 模十算法
    static func checkCardNumber(_ cardNumber: String?) -> Bool {

        guard cardNumber != nil && (cardNumber?.count ?? 0) > 0 else { return false }

        let cardNum = cardNumber?.replacingOccurrences(of: " ", with: "")

        var sumEven = 0
        var sumOdd = 0
        let cardNumLength = cardNum?.count ?? 0
        var i = 1

        while (i <= cardNumLength) {
            let subStr = (cardNum as NSString?)?.substring(with: NSRange(location: cardNumLength - i,
                                                                            length: 1))
            var subInt = Int(subStr ?? "") ?? 0
            // 偶数位
            if i % 2 == 0 {
                subInt *= 2
                if subInt > 9 {
                    subInt -= 9
                }
                sumEven += subInt
            // 奇数位
            } else {
                sumOdd += subInt
            }

            i += 1
        }

        let sum = sumOdd + sumEven
        if (sum % 10) == 0 {
            return true
        } else {
            return false
        }
    }

}
