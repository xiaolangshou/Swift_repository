//
//  FormView.swift
//  FormDemo
//
//  Created by mac on 2018/11/22.
//  Copyright © 2018 TLLTD. All rights reserved.
//

import UIKit
import SnapKit

protocol FormDelegate: NSObjectProtocol {
    
    func numOfRows(formView: FormView, rows: Int, colums: Int)
}

class FormView: UIView {
    
    var datas = [[Int]]()
    
    var nums = ItemModel() {
        didSet {
            delegate?.numOfRows(formView: self,
                                rows: nums.rows ?? 0,
                                colums: nums.colums ?? 0)
        }
    }
    
    weak var delegate: FormDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        
        backgroundColor = UIColor.lightText
    }
}
