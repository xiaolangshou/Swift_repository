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
    typealias dataType = (Bool, Int, String)
    var productArr: [dataType] = [(false, 1, "水果_苹果"), (false, 1, "水果_蓝莓"), (false, 1, "水果_杨梅"),
                                  (false, 1, "水果_香蕉"), (false, 1, "水果_百香果"), (false, 1, "水果_橙子")
    ]
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    let popOverView = UITableView().then {
        $0.backgroundColor = UIColor.systemBackColor
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
        
        scrollView.alwaysBounceVertical = true
        setupView()
    }

    func setupView() {
        
        view.backgroundColor = UIColor.systemGroupedBackground
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
            make.bottom.equalTo(-UIScreen.tabBarHeight)
        }
        bottomView.backgroundColor = UIColor.white
        bottomView.editBtnTap = { }
        bottomView.sumBtnTap = { [weak self] in
            let vc = BalanceVC()
            vc.hidesBottomBarWhenPushed = true
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        bottomView.selectAllBtnTap = { [weak self] in
            for v in (self?.containerView.subviews)! {
                if v.isMember(of: CargoCell.self) {
                    let cell = v as! CargoCell
                    cell.checkBtnTapped(btn: cell.checkBtn)
                }
            }
        }
        
        var prevCell: CargoCell?
        for (index, _) in productArr.enumerated() {
            let cell = CargoCell()
            containerView.addSubview(cell)
            
            if let prevCell = prevCell {
                cell.snp.makeConstraints { (make) in
                    make.left.equalTo(12)
                    make.right.equalTo(-12)
                    make.height.equalTo(124)
                    make.top.equalTo(prevCell.snp.bottom).offset(12)
                    if index == productArr.count - 1 {
                        make.bottom.equalToSuperview().offset(-70)
                    }
                }
            } else {
                cell.snp.makeConstraints { (make) in
                    make.left.equalTo(12)
                    make.right.equalTo(-12)
                    make.top.equalTo(12)
                    make.height.equalTo(124)
                }
            }
            
            prevCell = cell
            
            cell.tag = index
            cell.imgV.image = UIImage.init(named: productArr[index].2)
            
            cell.selectBtnTap = { [weak self] in
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
            cell.checkBtnTap = { [weak self] in
                
                self?.productArr[index].0 = cell.checkBtn.isSelected
                var sum = 0
                
                for i in self!.productArr {
                    if i.0 {
                        sum += i.1
                    }
                }
                
                self?.bottomView.sumBtn.setTitle("结算(\(sum))", for: .normal)
            }
            cell.minusBtnTap = { [weak self] num in
            
                self?.productArr[index] = (cell.checkBtn.isSelected, num, self!.productArr[index].2)
                var sum = 0
                
                for i in self!.productArr {
                    if i.0 {
                        sum += i.1
                    }
                }
                
                self?.bottomView.sumBtn.setTitle("结算(\(sum))", for: .normal)
            }
            cell.plusBtnTap = { [weak self] num in
                
                self?.productArr[index] = (cell.checkBtn.isSelected, num, self!.productArr[index].2)
                var sum = 0
                
                for i in self!.productArr {
                    if i.0 {
                        sum += i.1
                    }
                }

                self?.bottomView.sumBtn.setTitle("结算(\(sum))", for: .normal)
            }
        }
    }
}
