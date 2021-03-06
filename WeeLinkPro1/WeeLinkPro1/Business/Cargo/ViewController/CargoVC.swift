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
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.systemGroupedBackground
        } else {
            // Fallback on earlier versions
            view.backgroundColor = UIColor.systemBackColor
        }
        
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
        bottomView.selectAllBtnTap = { [weak self] isSelected in
            
            var j: dataType = (false, 1, "")
            for (index,i) in self!.productArr.enumerated() {
                j = i
                j.0 = isSelected
                print("isSelected = \(j.0)")
                j.1 = i.1
                j.2 = i.2
                
                self?.productArr[index] = j
            }
            
            for v in (self?.containerView.subviews)! {
                if v.isMember(of: CargoCell.self) {
                    let cell = v as! CargoCell
                    cell.checkBtn.isSelected = isSelected
                    if isSelected {
                        cell.checkBtn.setBackgroundImage(UIImage(named: "勾选_选中"), for: .normal)
                    } else {
                        cell.checkBtn.setBackgroundImage(UIImage(named: "勾选_未选中"), for: .normal)
                    }
                }
            }
            
            var sum = 0
            for i in self!.productArr {
                if i.0 {
                    sum += i.1
                }
            }
            self?.bottomView.sumBtn.setTitle("结算(\(sum))", for: .normal)
        }
        
        bottomView.cancelBtnTap = {
            
        }
        
        bottomView.deleteBtnTap = { [weak self] in
            
            for (i, v) in self!.productArr.enumerated() {
                if v.0 {
                    self?.productArr.remove(at: i)
                }
            }
            
            self?.reloadData()
        }
        
        reloadData()
    }
    
    func reloadData() {
        
        for v in containerView.subviews {
            if v.isMember(of: CargoCell.self) {
                v.removeFromSuperview()
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
                
                self?.productArr[index].0 = !self!.productArr[index].0
                
                print("isSelected = \(self!.productArr[index].0)")
                
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
