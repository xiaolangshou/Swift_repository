//
//  View2.swift
//  OCImportSwiftFileDemo
//
//  Created by lian shan on 2021/2/8.
//

import UIKit

class View2: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    func setupView() {

        self.backgroundColor = UIColor.cyan
    }
}
