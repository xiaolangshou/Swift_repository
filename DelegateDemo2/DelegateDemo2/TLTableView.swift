//
//  TLTableView.swift
//  DelegateDemo2
//
//  Created by Liu Tao on 2018/11/21.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import UIKit

protocol theDelegate: NSObjectProtocol {
    
    func didSelectViewAtIndexPath()
}

protocol theDataSource: NSObjectProtocol {
    
    func numberOfRowsInTableView()
}

class TLTableView: UIView {

    weak var delegate: theDelegate?
    weak var dataSource: theDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        backgroundColor = UIColor.cyan
    }
    
    func reload() {
        delegate?.didSelectViewAtIndexPath()
        dataSource?.numberOfRowsInTableView()
    }
}
