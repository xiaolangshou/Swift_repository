//
//  CargoVC.swift
//  WeeLinkPro1
//
//  Created by Liu Tao on 2020/5/14.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit
import Then

class CargoVC: UIViewController {

    static let shared = CargoVC()
    
    var dataArr = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    let popOverView = UITableView().then {
        $0.backgroundColor = UIColor.green
        $0.tag = 100
    }
    let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        containerView.backgroundColor = UIColor.systemGroupedBackground
        
        setupView()
    }

    func setupView() {
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
            make.bottom.equalTo(-UIScreen.tabBarHeight)
        }
        bottomView.backgroundColor = UIColor.green
        
        var prevCell: CargoCell?
        for (index, _) in dataArr.enumerated() {
            let cell = CargoCell()
            containerView.addSubview(cell)
            
            if let prevCell = prevCell {
                cell.snp.makeConstraints { (make) in
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.height.equalTo(120)
                    make.top.equalTo(prevCell.snp.bottom).offset(10)
                    if index == dataArr.count - 1 {
                        make.bottom.equalToSuperview()
                    }
                }
            } else {
                cell.snp.makeConstraints { (make) in
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.top.equalTo(10)
                    make.height.equalTo(120)
                }
            }
            
            prevCell = cell
            
            cell.btnTap = { [weak self] in
                if (cell.viewWithTag(100) == nil) {
                    cell.addSubview(self?.popOverView ?? UIView())
                    self?.popOverView.snp.makeConstraints({ (make) in
                        make.left.equalTo(cell.selectBtn.snp.left)
                        make.top.equalTo(cell.selectBtn.snp.bottom).offset(5)
                        make.width.equalTo(150)
                        make.height.equalTo(50)
                    })
                } else {
                    self?.popOverView.removeFromSuperview()
                }
            }
        }
    }
}
