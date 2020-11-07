//
//  ViewController.swift
//  UIStackViewDemo
//
//  Created by lian shan on 2020/11/6.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let hStackV = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStackView()
    }

    func oneDToTwoD(oneDimArray: [String], subCount: Int) -> [[String]] {

        let count = (oneDimArray.count / subCount) + (oneDimArray.count % subCount == 0 ? 0 : 1)

        var twoDimArray = [[Int]]()

        for _ in 0..<count {
            var arr = [Int]()
            for _ in 0..<subCount {
                arr.append(0)
            }
            twoDimArray.append(arr)
        }

        var iter = oneDimArray.makeIterator()

        let newArray = twoDimArray.map { $0.compactMap { _ in iter.next() } }

        print(newArray)
        return newArray
    }


    func setupStackView() {

        let dataArr = oneDToTwoD(oneDimArray: ["","","","","","","","","","","","","","","","","","",""],
                                 subCount: Int(UIScreen.main.bounds.size.width) / 50)
        
        let vStack = UIStackView.init()
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.distribution = .fillEqually
        view.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(100)
            make.height.equalTo(dataArr.count * 50)
        }
        
        for i in dataArr {
            let cell = Cell()
            cell.arr = i
            vStack.addArrangedSubview(cell)
            cell.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
            }
        }

    }
}

class Cell: UIView {
    
    var arr: [String] = [] {
        didSet {
            loadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    func loadData() {
        
        var preS = UIButton()
        for (i,_) in arr.enumerated() {
            let s = UIButton.init()
            s.setBackgroundImage(UIImage.init(named: "111"), for: .normal)
            s.imageEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
            s.contentMode = .scaleAspectFill
            self.addSubview(s)
            
            let offset = UIScreen.main.bounds.size.width.truncatingRemainder(dividingBy: 50)
            let h = ceil(offset / CGFloat((UIScreen.main.bounds.size.width) / 50))
            if i == 0 {
                s.snp.makeConstraints { make in
                    make.left.equalTo(0)
                    make.top.bottom.equalToSuperview()
                    make.width.equalTo(50)
                }
            } else {
                s.snp.makeConstraints { make in
                    make.left.equalTo(preS.snp.right).offset(h)
                    make.top.bottom.equalToSuperview()
                    make.width.equalTo(50)
                }
            }
            
            preS = s
        }
    }
}
