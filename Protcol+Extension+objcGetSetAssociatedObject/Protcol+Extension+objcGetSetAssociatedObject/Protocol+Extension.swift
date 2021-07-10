//
//  Protocol+Extension.swift
//  Protcol+Extension+objcGetSetAssociatedObject
//
//  Created by lian shan on 2021/7/4.
//

import Foundation

class Config {

    var name = ""

    init(name: String) {
        self.name = name
    }
}

struct AssociateKey {
    static var key = "showKey"
}

protocol ConfigProtocol {

    func getConfig() -> Config?
    func setConfig(config: Config)
}

extension ConfigProtocol {

    func getConfig() -> Config? {
        let config = objc_getAssociatedObject(self, AssociateKey.key) as? Config
        if config == nil {
            print("get config failed")
            fatalError()
        } else {
            return config
        }
    }

    func setConfig(config: Config) {
        objc_setAssociatedObject(self, AssociateKey.key, config, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
