//
//  ViewController.swift
//  ProtocolDemo2
//
//  Created by Thomas Lau on 2018/8/9.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

/// 协议扩展(protocol + extension), extension为Protocol提供默认实现，变相将Protocol的方法设定为optional
protocol VC1Protcol {
    
    var h: Int { get set }
    var w: Int { get set }
    
    func func1()
    mutating func func2()// protocol的方法被mutating修饰，才能保证struct和enum实现时可以改变属性的值
}

extension VC1Protcol {
    
    func func1() {
        print(self.h)
    }
    
    func func2() {
        print(self.w)
    }
}

class VC2: VC1Protcol {
    
    var w: Int = 0
    var h: Int = 0
    
    init(ww: Int, hh: Int) {
        w = ww
        h = hh
    }
    
    func func2() {
        print("func two class")
        
        h += 3
        print("\(h)")
    }
}

struct VC3: VC1Protcol {
    
    var h: Int = 0
    var w: Int = 0
    
    mutating func func2() {
        print("func two")
        
        h += 3
        print("\(h)")
    }
}

class ViewController: UIViewController {
    
    var vc2 = VC2.init(ww: 100, hh: 20)
    var vc3 = VC3.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vc2.func1()
        vc2.func2()
        
        vc2.h = 2000
        vc2.w = 4000

        vc2.func1()
        vc2.func2()

        vc3.func2()
        
        let btn = UIButton.init(frame: CGRect.init(x: 20, y: 400, width: 80, height: 30))
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(btnTapped), for: UIControlEvents.touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func btnTapped() {
        let vc2 = ViewController2()
        self.present(vc2, animated: true, completion: nil)
    }
}

