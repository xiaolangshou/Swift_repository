//
//  TLView.swift
//  SDKFramework
//
//  Created by Thomas Lau on 2020/3/16.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

public class TLView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init coder has not been implement")
    }
    
    func setupUI() {
        self.backgroundColor = UIColor.cyan
    }

}
