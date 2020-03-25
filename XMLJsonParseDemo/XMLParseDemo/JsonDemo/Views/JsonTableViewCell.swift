//
//  MyTableViewCell.swift
//  XMLParseDemo
//
//  Created by Liu Tao on 2018/3/13.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import SnapKit

class JsonTableViewCell: UITableViewCell {

    fileprivate let _detailLabel = UILabel()

    var detailText: String? {
        didSet {
            _detailLabel.text = detailText
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        initCell()
    }

    private func initCell() {

        backgroundColor = UIColor.clear
        selectionStyle = .none

        self.addSubview(_detailLabel)
        _detailLabel.textColor = UIColor.lightGray
        _detailLabel.numberOfLines = 0
        _detailLabel.lineBreakMode = .byWordWrapping
        _detailLabel.snp.makeConstraints({ (make) in
            make.left.equalTo((textLabel?.snp.left)!)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-2)
        })
    }

}
