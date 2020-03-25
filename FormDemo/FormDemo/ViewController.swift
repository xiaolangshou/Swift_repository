//
//  ViewController.swift
//  FormDemo
//
//  Created by mac on 2018/11/22.
//  Copyright © 2018 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let formView = FormView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        
        formView.delegate = self
        formView.nums = ItemModel(rows: 6, colums: 6)
        formView.backgroundColor = UIColor.lightText
        view.addSubview(formView)
        formView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
            make.height.equalTo(39 * 6 + (1 * 5))
            make.width.equalTo(39 * 6 + (1 * 5))
        }
    }
}

extension ViewController: FormDelegate {
    
    func numOfRows(formView: FormView, rows: Int, colums: Int) {
        
        for index in 0..<rows {
            
            var prevColumCell: UILabel?
            
            for _ in 0..<colums {
                let c = UILabel()
                c.backgroundColor = UIColor.green
                formView.addSubview(c)

                if let prevColumCell = prevColumCell {
                    c.snp.makeConstraints { (make) in
                        make.left.equalTo(prevColumCell.snp.right).offset(1)
                        make.top.equalTo(prevColumCell.snp.top)
                        make.width.equalTo(39)
                        make.height.equalTo(39)
                    }
                } else {
                    c.snp.makeConstraints { (make) in
                        make.left.equalTo(1)
                        make.top.equalTo(index * (39 + 1))
                        make.height.equalTo(39)
                        make.width.equalTo(39)
                    }
                }
                prevColumCell = c
            }
        }
    }
}

