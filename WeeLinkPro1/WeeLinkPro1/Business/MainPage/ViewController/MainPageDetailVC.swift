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
    
    var sortArrow1: UIImageView?
    var sortArrow2: UIImageView?
    var sortArrow3: UIImageView?
    var sortArrow4: UIImageView?
    
    var sortTable1: UITableView?
    var sortTable2: UITableView?
    var sortTable3: UITableView?
    var sortTable4: UITableView?
    
    var dataArr = [["1","2","3","4"],
                   ["1","2","3","4"],
                   ["1","2","3","4"],
                   ["1","2","3","4"]]
    
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
        }
        backView?.backgroundColor = UIColor.white
        
        sortBtn1 = UIButton.init()
        backView?.addSubview(sortBtn1 ?? UIView())
        sortBtn1?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25 - 20)
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortBtn1?.setTitle("排序标签", for: .normal)
        sortBtn1?.setTitleColor(UIColor.gray, for: .normal)
        sortBtn1?.titleLabel?.font = UIFont.PFMedium(13.0)
        sortBtn1?.addTarget(self, action: #selector(sortBtnTapped1), for: .touchUpInside)
        
        sortArrow1 = UIImageView()
        backView?.addSubview(sortArrow1 ?? UIView())
        sortArrow1?.snp.makeConstraints({ (make) in
            make.left.equalTo(sortBtn1?.snp.right ?? 0)
            make.width.equalTo(20)
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortArrow1?.backgroundColor = UIColor.cyan
        
        sortBtn2 = UIButton.init()
        backView?.addSubview(sortBtn2 ?? UIView())
        sortBtn2?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25 - 20)
            make.left.equalTo(sortArrow1?.snp.right ?? UIView())
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortBtn2?.setTitle("排序标签", for: .normal)
        sortBtn2?.setTitleColor(UIColor.gray, for: .normal)
        sortBtn2?.titleLabel?.font = UIFont.PFMedium(13.0)
        sortBtn2?.addTarget(self, action: #selector(sortBtnTapped2), for: .touchUpInside)
        
        sortArrow2 = UIImageView.init()
        backView?.addSubview(sortArrow2 ?? UIView())
        sortArrow2?.snp.makeConstraints({ (make) in
            make.width.equalTo(20)
            make.left.equalTo(sortBtn2?.snp.right ?? 0)
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortArrow2?.backgroundColor = UIColor.cyan
        
        sortBtn3 = UIButton.init()
        backView?.addSubview(sortBtn3 ?? UIView())
        sortBtn3?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25 - 20)
            make.left.equalTo(sortArrow2?.snp.right ?? UIView())
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortBtn3?.setTitle("排序标签", for: .normal)
        sortBtn3?.setTitleColor(UIColor.gray, for: .normal)
        sortBtn3?.titleLabel?.font = UIFont.PFMedium(13.0)
        sortBtn3?.addTarget(self, action: #selector(sortBtnTapped3), for: .touchUpInside)
        
        sortArrow3 = UIImageView()
        backView?.addSubview(sortArrow3 ?? UIView())
        sortArrow3?.snp.makeConstraints({ (make) in
            make.width.equalTo(20)
            make.left.equalTo(sortBtn3?.snp.right ?? 0)
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortArrow3?.backgroundColor = UIColor.cyan
        
        sortBtn4 = UIButton.init()
        backView?.addSubview(sortBtn4 ?? UIView())
        sortBtn4?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25 - 20)
            make.left.equalTo(sortArrow3?.snp.right ?? UIView())
            make.top.equalToSuperview()
            make.height.equalToSuperview()
        })
        sortBtn4?.setTitle("排序标签", for: .normal)
        sortBtn4?.setTitleColor(UIColor.gray, for: .normal)
        sortBtn4?.titleLabel?.font = UIFont.PFMedium(13.0)
        sortBtn4?.addTarget(self, action: #selector(sortBtnTapped4), for: .touchUpInside)
        
        sortArrow4 = UIImageView()
        backView?.addSubview(sortArrow4 ?? UIView())
        sortArrow4?.snp.makeConstraints({ (make) in
            make.right.equalToSuperview()
            make.left.equalTo(sortBtn4?.snp.right ?? UIView())
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortArrow4?.backgroundColor = UIColor.cyan
        
        sortTable1 = UITableView()
        view.addSubview(sortTable1!)
        sortTable1?.snp.makeConstraints({ (make) in
            make.width.equalTo((sortBtn1?.snp.width)!)
            make.top.equalTo((backView?.snp.bottom)!).offset(0.5)
            make.height.equalTo(60)
            make.centerX.equalTo((sortBtn1?.snp.centerX)!)
        })
        sortTable1?.backgroundColor = UIColor.green
        sortTable1?.isHidden = true
        sortTable1?.tag = 1
        sortTable1?.delegate = self
        sortTable1?.dataSource = self
        sortTable1?.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        sortTable1?.rowHeight = 40
        
        sortTable2 = UITableView.init()
        view.addSubview(sortTable2!)
        sortTable2?.snp.makeConstraints({ (make) in
            make.width.equalTo((sortBtn2?.snp.width)!)
            make.top.equalTo((backView?.snp.bottom)!).offset(0.5)
            make.height.equalTo(60)
            make.centerX.equalTo((sortBtn2?.snp.centerX)!)
        })
        sortTable2?.backgroundColor = UIColor.green
        sortTable2?.isHidden = true
        sortTable2?.tag = 2
        sortTable2?.delegate = self
        sortTable2?.dataSource = self
        sortTable2?.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        sortTable2?.rowHeight = 40
        
        sortTable3 = UITableView.init()
        view.addSubview(sortTable3!)
        sortTable3?.snp.makeConstraints({ (make) in
            make.width.equalTo((sortBtn3?.snp.width)!)
            make.top.equalTo((backView?.snp.bottom)!).offset(0.5)
            make.height.equalTo(60)
            make.centerX.equalTo((sortBtn3?.snp.centerX)!)
        })
        sortTable3?.backgroundColor = UIColor.green
        sortTable3?.isHidden = true
        sortTable3?.tag = 3
        sortTable3?.delegate = self
        sortTable3?.dataSource = self
        sortTable3?.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        sortTable3?.rowHeight = 40
        
        sortTable4 = UITableView.init()
        view.addSubview(sortTable4!)
        sortTable4?.snp.makeConstraints({ (make) in
            make.width.equalTo((sortBtn4?.snp.width)!)
            make.top.equalTo((backView?.snp.bottom)!).offset(0.5)
            make.height.equalTo(60)
            make.centerX.equalTo((sortBtn4?.snp.centerX)!)
        })
        sortTable4?.backgroundColor = UIColor.green
        sortTable4?.isHidden = true
        sortTable4?.tag = 4
        sortTable4?.delegate = self
        sortTable4?.dataSource = self
        sortTable4?.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        sortTable4?.rowHeight = 40
    }
    
    @objc func sortBtnTapped1() {
        sortTable1!.isHidden = !sortTable1!.isHidden
    }
    
    @objc func sortBtnTapped2() {
        sortTable2!.isHidden = !sortTable2!.isHidden
    }
    
    @objc func sortBtnTapped3() {
        sortTable3!.isHidden = !sortTable3!.isHidden
    }
    
    @objc func sortBtnTapped4() {
        sortTable4!.isHidden = !sortTable4!.isHidden
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
                    make.height.equalTo(120)
                    make.top.equalTo(prevCell.snp.bottom).offset(1)
                    if index == dataArr.count - 1 {
                        make.bottom.equalToSuperview()
                    }
                }
            } else {
                cell.snp.makeConstraints { (make) in
                    make.width.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.top.equalTo(backView?.snp.bottom ?? UIView()).offset(1)
                    make.height.equalTo(120)
                }
            }
            
            prevCell = cell
            
            cell.cellTap = { [weak self] in
                let vc = ProductDetailVC()
                vc.hidesBottomBarWhenPushed = true
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

extension MainPageDetailVC: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.resignFirstResponder()
    }
}

extension MainPageDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView.tag {
        case 1:
            return dataArr[0].count
        case 2:
            return dataArr[1].count
        case 3:
            return dataArr[2].count
        case 4:
            return dataArr[3].count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") else { return UITableViewCell() }
        
        switch tableView.tag {
        case 1:
            cell.textLabel?.text = dataArr[0][indexPath.row]
        case 2:
            cell.textLabel?.text = dataArr[1][indexPath.row]
        case 3:
            cell.textLabel?.text = dataArr[2][indexPath.row]
        case 4:
            cell.textLabel?.text = dataArr[3][indexPath.row]
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
}

class MainPageDetailCell: UIView {
    
    var cellTap: (() -> (Void))?
    
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
        
        self.backgroundColor = UIColor.white
        
        self.addSubview(imgV)
        imgV.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalTo(6)
        }
        imgV.backgroundColor = UIColor.cyan
        imgV.layer.cornerRadius = 5.0
        
        self.addSubview(pName)
        pName.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(8)
            make.top.equalTo(imgV.snp.top).offset(8)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        pName.text = "商品名称"
        pName.font = UIFont.PFMedium(17.0)
        pName.textColor = UIColor.hex(0x787878)
        
        self.addSubview(numLbl)
        numLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(8)
            make.top.equalTo(pName.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        numLbl.text = "16（只）"
        numLbl.font = UIFont.PFMedium(15.0)
        numLbl.textColor = UIColor.hex(0x787878)
        
        self.addSubview(priceLbl)
        priceLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(8)
            make.width.equalTo(80)
            make.height.equalTo(20)
            make.bottom.equalTo(-10)
        }
        priceLbl.text = "￥20.5"
        priceLbl.font = UIFont.PFMedium(17.0)
        priceLbl.textColor = UIColor.hex(0x787878)
        
        self.addSubview(addBtn)
        addBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.right.equalTo(-12)
            make.bottom.equalTo(-28)
        }
        addBtn.layer.cornerRadius = 3.0
        addBtn.backgroundColor = UIColor.hex(0xF2F2F2)
        addBtn.setTitle("+", for: .normal)
        addBtn.setTitleColor(UIColor.hex(0x939393), for: .normal)
        addBtn.titleLabel?.font = UIFont.PFRegular(20)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func cellTapped() {
        
        self.cellTap!()
    }
    
}
