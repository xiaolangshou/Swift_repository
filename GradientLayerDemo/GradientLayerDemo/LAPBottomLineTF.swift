//
//  LAPBottomLineTF.swift
//  GradientLayerDemo
//
//  Created by lian shan on 2021/1/6.
//

import UIKit

class LAPBottomLineTF: UIView {

    var infoBtnTap: (() -> Void)?
    var changeText: ((String, NSRange, String) -> Bool)?
    var needCheckCard = false
    var isCvv = false
    var isCreditCard = false
    var needClearTips = false {
        didSet {
            if needClearTips {
                clearTips()
            }
        }
    }
    var serverTips = ""
    var checkText: ((String) -> Bool)?
    var needTFDidEditing = true
    var tFDidEndEditing: ((String) -> Void)?
    var tFDidBeginEditing: ((String) -> Void)?

    var showInfo = false {
        didSet {
            updateInfoBtnWidth(show: showInfo)
        }
    }

    var stackCount = 0 {
        didSet {
            updateStackWidth(show: showStack, count: stackCount)
        }
    }
    var showStack = false {
        didSet {
            updateStackWidth(show: showStack, count: stackCount)
        }
    }

    var placeHolder: String? {
        didSet {
            topLbl.text = placeHolder
        }
    }

    var highlightColor = UIColor.blue {
        didSet {
            bottomLine.backgroundColor = highlightColor
            topLbl.textColor = highlightColor
        }
    }

    var prefixNo = "" {
        didSet {
            prefixLbl.text = prefixNo
            prefixLbl.textAlignment = .left
            prefixLbl.snp.remakeConstraints { make in
                make.left.equalToSuperview()
                make.top.equalTo(topLbl.snp.bottom)
                make.bottom.equalTo(bottomLine.snp.top)
                if prefixNo == "" {
                    make.width.equalTo(0)
                } else {
                    make.width.lessThanOrEqualTo(40)
                }
            }
        }
    }

    var ignoreTopLbl = false {
        didSet {
            topLbl.isHidden = false
        }
    }

    let topLbl = UILabel()
    let bottomTF = UITextField()
    let bottomLine = UIView()
    let bottomLbl = UILabel()
    let prefixLbl = UILabel()
    let infoBtn = UIButton()
    let rightStackV = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {

        self.addSubview(topLbl)
        topLbl.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
        }
        topLbl.textColor = UIColor.gray
        topLbl.isHidden = true

        self.addSubview(bottomLbl)
        bottomLbl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        bottomLbl.textColor = UIColor.red

        self.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { make in
            make.bottom.equalTo(bottomLbl.snp.top).offset(-2)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        bottomLine.backgroundColor = UIColor.gray

        self.addSubview(prefixLbl)
        prefixLbl.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(topLbl.snp.bottom)
            make.bottom.equalTo(bottomLine.snp.top)
            if prefixNo == "" {
                make.width.equalTo(0)
            }
        }
        prefixLbl.textColor = UIColor.gray

        self.addSubview(infoBtn)
        infoBtn.snp.makeConstraints { make in
            make.height.equalTo(15)
            make.width.equalTo(0)
            make.right.equalTo(-3)
            make.bottom.equalTo(bottomLine.snp.top).offset(-3)
        }
        infoBtn.addTarget(self, action: #selector(infoBtnTapped), for: .touchUpInside)
        infoBtn.setBackgroundImage(UIImage.init(named: "LAP_info"), for: .normal)

        self.addSubview(rightStackV)
        rightStackV.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.right.equalTo(infoBtn.snp.left)
            make.bottom.equalTo(bottomLine.snp.top)
            make.width.equalTo(0)
        }
        rightStackV.axis = .horizontal
        rightStackV.distribution = .fillEqually
        self.addSubview(rightStackV)

        self.addSubview(bottomTF)
        bottomTF.snp.makeConstraints { make in
            make.left.equalTo(prefixLbl.snp.right).offset(4)
            make.right.equalTo(rightStackV.snp.left)
            make.top.equalTo(topLbl.snp.bottom)
            make.bottom.equalTo(bottomLine.snp.top)
        }
        bottomTF.delegate = self
        bottomTF.inputAccessoryView = addToolBar()
    }

    func clearTips() {
        bottomLbl.text = nil
        bottomLbl.isHidden = true
        bottomLine.backgroundColor = UIColor.gray
    }

    func updateInfoBtnWidth(show: Bool) {
        if show {
            infoBtn.snp.updateConstraints { make in
                make.width.equalTo(15)
            }
        } else {
            infoBtn.snp.updateConstraints { make in
                make.width.equalTo(0)
            }
        }
    }

    func updateStackWidth(show: Bool, count: Int) {
        if show {
            rightStackV.snp.updateConstraints { make in
                make.width.equalTo(count * 30)
            }
        } else {
            rightStackV.snp.updateConstraints { make in
                make.width.equalTo(0)
            }
        }
    }

    func addToolBar() -> UIToolbar {
        return UIToolbar()
    }

    @objc func textFieldDone() {
        self.bottomTF.resignFirstResponder()
    }

    @objc func infoBtnTapped() {
        infoBtnTap?()
    }
}

extension LAPBottomLineTF: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {

        if !ignoreTopLbl {
            topLbl.isHidden = false
            textField.attributedPlaceholder = NSAttributedString(string: placeHolder ?? "",
                                                                 attributes: [.foregroundColor : UIColor.clear])
        }
        bottomLbl.text = nil

        tFDidBeginEditing?(textField.text ?? "")
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {

        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {

        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        if !ignoreTopLbl {
            topLbl.isHidden = true
            textField.attributedPlaceholder = NSAttributedString(string: placeHolder ?? "",
                                                                 attributes: [.foregroundColor : UIColor.gray,
                                                                              .font: UIFont.systemFont(ofSize: 12)])
        }

        if textField.text != "" {
            topLbl.isHidden = false
        }
        bottomLine.backgroundColor = UIColor.gray
        topLbl.textColor = UIColor.gray

        if needCheckCard {
            let valid = checkText?(textField.text ?? "") ?? true
            if !valid {
                bottomLbl.isHidden = false
                bottomLine.backgroundColor = UIColor.red

            } else {
                bottomLbl.text = nil
                bottomLbl.isHidden = true
                bottomLine.backgroundColor = UIColor.gray
            }
        }

        if needTFDidEditing {
            tFDidEndEditing?(textField.text ?? "")
        }
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        guard let text = textField.text else { return true }

        return changeText?(text, range, string) ?? true
    }
}
