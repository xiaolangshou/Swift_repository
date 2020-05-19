//
//  MainPageDetailVC.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/19.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class MainPageDetailVC: UIViewController {

    let scrollView = UIScrollView()
    let containerView = UIView()
    let searchBar = SearchBar()
    
    var backView: UIView?
    var sortBtn1: UIButton?
    var sortBtn2: UIButton?
    var sortBtn3: UIButton?
    var sortBtn4: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupSearchBar()
        setupSortView()
        setupListView()
    }
    
    func setupView() {
        
        view.backgroundColor = UIColor.hex(0xF2F2F2)
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(UIScreen.navBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    func setupSearchBar() {
        
        containerView.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.width.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        searchBar.placeholder = "搜索内容"
        searchBar.delegate = self
        searchBar.cancelBtnTap = { [weak self] in
            self?.searchBar.delegate?.searchBarCancelButtonClicked?(self!.searchBar)
        }
    }
    
    func setupSortView() {
        
        backView = UIView().then { (b) in
            containerView.addSubview(b)
            b.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.top.equalTo(searchBar.snp.bottom)
                make.height.equalTo(40)
            }
            b.backgroundColor = UIColor.cyan
        }
        
        sortBtn1 = UIButton.init()
        backView?.addSubview(sortBtn1 ?? UIView())
        sortBtn1?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25)
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortBtn1?.setTitle("排序标签", for: .normal)
        sortBtn1?.setTitleColor(UIColor.gray, for: .normal)
        
        sortBtn2 = UIButton.init()
        backView?.addSubview(sortBtn2 ?? UIView())
        sortBtn2?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25)
            make.left.equalTo(sortBtn1?.snp.right ?? UIView())
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortBtn2?.setTitle("排序标签", for: .normal)
        sortBtn2?.setTitleColor(UIColor.gray, for: .normal)
        
        sortBtn3 = UIButton.init()
        backView?.addSubview(sortBtn3 ?? UIView())
        sortBtn3?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25)
            make.left.equalTo(sortBtn2?.snp.right ?? UIView())
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortBtn3?.setTitle("排序标签", for: .normal)
        sortBtn3?.setTitleColor(UIColor.gray, for: .normal)
        
        sortBtn4 = UIButton.init()
        backView?.addSubview(sortBtn4 ?? UIView())
        sortBtn4?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25)
            make.left.equalTo(sortBtn3?.snp.right ?? UIView())
            make.top.equalToSuperview()
            make.height.equalToSuperview()
            make.right.equalToSuperview()
        })
        sortBtn4?.setTitle("排序标签", for: .normal)
        sortBtn4?.setTitleColor(UIColor.gray, for: .normal)
    }
    
    func setupListView() {
        
        let dataArr = [1,1,1,1,1,1,1,1,1]
        var prevCell: MainPageDetailCell?
        for (index, _) in dataArr.enumerated() {
            let cell = MainPageDetailCell()
            containerView.addSubview(cell)
            
            if let prevCell = prevCell {
                cell.snp.makeConstraints { (make) in
                    make.width.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.height.equalTo(90)
                    make.top.equalTo(prevCell.snp.bottom).offset(5)
                    if index == dataArr.count - 1 {
                        make.bottom.equalToSuperview()
                    }
                }
            } else {
                cell.snp.makeConstraints { (make) in
                    make.width.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.top.equalTo(backView?.snp.bottom ?? UIView()).offset(5)
                    make.height.equalTo(90)
                }
            }
            
            prevCell = cell
        }
    }
}

extension MainPageDetailVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.cancelBtn.isHidden = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchBar.cancelBtn.isHidden = true
    }
}

class MainPageDetailCell: UIView {
    
    let imgV = UIImageView.init()
    let pName = UILabel.init()
    let numLbl = UILabel.init()
    let priceLbl = UILabel.init()
    let addBtn = UIButton.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        self.addSubview(imgV)
        imgV.snp.makeConstraints { (make) in
            make.width.height.equalTo(80)
            make.centerY.equalToSuperview()
            make.left.equalTo(6)
        }
        imgV.backgroundColor = UIColor.cyan
        imgV.layer.cornerRadius = 4.0
        
        self.addSubview(pName)
        pName.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(8)
            make.top.equalTo(imgV.snp.top).offset(8)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        pName.text = "商品名称"
        
        self.addSubview(numLbl)
        numLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(8)
            make.top.equalTo(pName.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        numLbl.text = "16（只）"
        
        self.addSubview(priceLbl)
        priceLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(8)
            make.width.equalTo(80)
            make.height.equalTo(20)
            make.bottom.equalTo(-10)
        }
        priceLbl.text = "$20.5"
        
        self.addSubview(addBtn)
        addBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.right.equalTo(-12)
            make.bottom.equalTo(-28)
        }
        addBtn.layer.cornerRadius = 3.0
        addBtn.backgroundColor = UIColor.lightGray
        addBtn.setTitle("+", for: .normal)
        addBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    
}
