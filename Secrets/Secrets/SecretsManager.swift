//
//  SecretsMng.swift
//  Secrets
//
//  Created by Thomas Lau on 2021/2/17.
//  Copyright © 2021 TLLTD. All rights reserved.
//

import Foundation
import UIKit

public class SecretsManager: UIViewController {
    
    public var name = ""
    
    @objc public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @objc public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc public func func1() {
        print(#function)
    }
    
    @objc public func func2() {
        print(#function)
    }
}
