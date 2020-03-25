//
//  XmlTableViewCell.swift
//  XMLParseDemo
//
//  Created by Liu Tao on 2018/3/14.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

class XmlTableViewCell: UITableViewCell {

    fileprivate let _detailLabel = UILabel()
    fileprivate let _textLabel = UILabel()

    var detailText: String? {
        didSet {
            _detailLabel.text = detailText
        }
    }

    var labelText: String? {
        didSet {
            _textLabel.text = labelText
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

        self.addSubview(_textLabel)
        _textLabel.numberOfLines = 0
        _textLabel.lineBreakMode = .byWordWrapping
        _textLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
        }

        self.addSubview(_detailLabel)
        _detailLabel.textColor = UIColor.lightGray
        _detailLabel.numberOfLines = 0
        _detailLabel.lineBreakMode = .byWordWrapping
        _detailLabel.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-2)
        })
    }

}
