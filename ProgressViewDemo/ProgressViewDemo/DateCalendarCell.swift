//
//  DateCalendarCell.swift
//  Soccer
//
//  Created by Thomas Lau on 2018/4/23.
//  Copyright © 2018年 追球体育. All rights reserved.
//

import UIKit
import SnapKit

class DateCalendarCell: UICollectionViewCell {
    
    var labelText = String() {
        didSet {
            _dateLabel.text = labelText
        }
    }
    
    var labelColor = UIColor.white {
        didSet {
            _dateLabel.textColor = labelColor
        }
    }
    
    fileprivate let _dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    fileprivate func setupView() {
        
        self.layer.cornerRadius = 0.5 * (UIScreen.main.bounds.width / 7 - 3)
        
        _dateLabel.textAlignment = .center
        self.addSubview(_dateLabel)
        _dateLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
