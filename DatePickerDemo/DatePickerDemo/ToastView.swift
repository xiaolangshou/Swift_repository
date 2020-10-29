//
//  ToastView.swift
//  DatePickerDemo
//
//  Created by lian shan on 2020/10/27.
//

import UIKit
import SnapKit

class LABindCardToastView: UIView {
    
    var dataArr: [String] = ["Rp 250,000", "Rp 500,000", "Rp 750,000", "Rp 1,000,000",
                             "Rp 1,250,000", "Rp 1,500,000", "Rp 1,750,000", "Rp 2,000,000"]
    var pickerView: UIPickerView!
    let confirmBtn = UIButton()
    let cancelBtn = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        pickerView = UIPickerView()
        //将dataSource设置成自己
        pickerView.dataSource = self
        //将delegate设置成自己
        pickerView.delegate = self
        //设置选择框的默认值
        pickerView.selectRow(1,inComponent:0,animated:true)
        self.addSubview(pickerView)
        pickerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(300)
        }
         
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        self.addSubview(confirmBtn)
        confirmBtn.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.bottom.equalTo(pickerView.snp.top)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        confirmBtn.setTitle("CONFIRM", for: .normal)
        confirmBtn.setTitleColor(UIColor.blue, for: .normal)
        confirmBtn.addTarget(self, action: #selector(confirmBtnTapped),
                         for: .touchUpInside)
        
        self.addSubview(cancelBtn)
        cancelBtn.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.bottom.equalTo(pickerView.snp.top)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        cancelBtn.setTitle("CANCEL", for: .normal)
        cancelBtn.setTitleColor(UIColor.blue, for: .normal)
        cancelBtn.addTarget(self, action:#selector(cancelBtnTapped),
                         for: .touchUpInside)
        
    }
    
    @objc func cancelBtnTapped() {
        
        self.removeFromSuperview()
    }
    
    // 触摸按钮时，获得被选中的索引
    @objc func confirmBtnTapped() {
        
        let message = dataArr[pickerView.selectedRow(inComponent: 0)]
        print(message)
        self.removeFromSuperview()
    }
}

extension LABindCardToastView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //设置选择框的列数为3列,继承于UIPickerViewDataSource协议
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
     
    //设置选择框的行数为9行，继承于UIPickerViewDataSource协议
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int
    {
        return dataArr.count
    }
     
    //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String?
    {
        
        return dataArr[row]
    }
}

extension LABindCardToastView {
    
    static func show() {
        let toast = LABindCardToastView()
        UIApplication.shared.keyWindow?.addSubview(toast)
        toast.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
