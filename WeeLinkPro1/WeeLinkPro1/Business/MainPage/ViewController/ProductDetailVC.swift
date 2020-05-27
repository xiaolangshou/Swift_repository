//
//  ProductDetailVC.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/20.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class BottomIcon: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        let imgV = UIImageView()
        self.addSubview(imgV)
        imgV.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.top.equalTo(3)
            make.centerX.equalToSuperview()
        }
        
        let title = UILabel()
        self.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.top.equalTo(imgV.snp.bottom).offset(3)
            make.width.equalToSuperview()
            make.bottom.equalTo(0)
            make.centerX.equalToSuperview()
        }
        
        let icon = UIImageView()
        self.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.width.height.equalTo(icon)
            make.right.equalTo(0)
            make.top.equalTo(0)
        }
        icon.backgroundColor = UIColor.red
    }
}

class ProductDetailVC: UIViewController {
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    var banner: Banner?
    var dataArr = [1,1,1,1]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupBottomView()
    }

    func setupBottomView() {
        
        let consult = BottomIcon()
        let collect = BottomIcon()
        let cargo = BottomIcon()
        
        let cargoBtn = UIButton()
        let purchaseBtn = UIButton()
        
        let bView = UIView()
        view.addSubview(bView)
        bView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(80)
        }
        bView.backgroundColor = UIColor.green
        
        bView.addSubview(consult)
        consult.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.width / 7)
        }
        consult.backgroundColor = UIColor.cyan
        
        bView.addSubview(collect)
        collect.snp.makeConstraints { (make) in
            make.left.equalTo(consult.snp.right).offset(10)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.width / 7)
        }
        collect.backgroundColor = UIColor.cyan
        
        bView.addSubview(cargo)
        cargo.snp.makeConstraints { (make) in
            make.left.equalTo(collect.snp.right).offset(10)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.width / 7)
        }
        cargo.backgroundColor = UIColor.cyan
        
        bView.addSubview(purchaseBtn)
        purchaseBtn.snp.makeConstraints { (make) in
            make.width.equalTo(90)
            make.height.equalTo(50)
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
        }
        purchaseBtn.layer.cornerRadius = 4.0
        purchaseBtn.backgroundColor = UIColor.lightGray
        purchaseBtn.setTitle("立即购买", for: UIControl.State.normal)
        
        bView.addSubview(cargoBtn)
        cargoBtn.snp.makeConstraints { (make) in
            make.width.equalTo(90)
            make.height.equalTo(50)
            make.right.equalTo(purchaseBtn.snp.left).offset(-10)
            make.centerY.equalToSuperview()
        }
        cargoBtn.layer.cornerRadius = 4.0
        cargoBtn.backgroundColor = UIColor.lightGray
        cargoBtn.setTitle("加入购物车", for: UIControl.State.normal)
    }
    
    func setupView() {
        
        view.backgroundColor = UIColor.systemBackColor
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
        
        setupBanner()
        setupDetailView()
    }
    
    func setupBanner() {
        
        banner = Banner()
        banner!.type = .rightCorn
        containerView.addSubview(banner!)
        banner!.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(300)
        }
        banner!.imageArray.append(UIImage(named: "11")!)
        banner!.imageArray.append(UIImage(named: "22")!)
        banner!.imageArray.append(UIImage(named: "11")!)
        banner!.imageArray.append(UIImage(named: "22")!)
        banner!.imageArray.append(UIImage(named: "11")!)
        banner!.imageArray.append(UIImage(named: "22")!)
        banner!.imageArray.append(UIImage(named: "11")!)
        banner!.count = 7
        
        banner!.onClickBanner = { [unowned self] idx in
            print(idx)
        }
    }
    
    func setupDetailView() {
        
        let nameLbl = UILabel.init()
        let numLbl = UILabel.init()
        let detailLbl = UILabel.init()
        let priceLbl = UILabel.init()
        let saleLbl = UILabel.init()
        
        let subView = UIView.init().then({ (s) in
            containerView.addSubview(s)
            s.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.top.equalTo((banner?.snp.bottom)!)
                make.height.equalTo(110)
            }
            s.backgroundColor = UIColor.white
            
            s.addSubview(nameLbl)
            nameLbl.text = "商品名称"
            nameLbl.snp.makeConstraints { (make) in
                make.left.top.equalTo(10)
                make.width.equalTo(90)
                make.height.equalTo(30)
            }
            
            s.addSubview(numLbl)
            numLbl.text = "16（只）"
            numLbl.snp.makeConstraints { (make) in
                make.left.equalTo(10)
                make.top.equalTo(nameLbl.snp.bottom).offset(5)
                make.width.equalTo(90)
                make.height.equalTo(20)
            }
            
            s.addSubview(detailLbl)
            detailLbl.text = "副内容"
            detailLbl.snp.makeConstraints { (make) in
                make.left.equalTo(numLbl.snp.right).offset(5)
                make.right.equalTo(-10)
                make.centerY.equalTo(numLbl.snp.centerY)
                make.height.equalTo(20)
            }
            
            s.addSubview(priceLbl)
            priceLbl.text = "￥32.5 ￥38.5"
            priceLbl.snp.makeConstraints { (make) in
                make.width.equalTo(110)
                make.height.equalTo(20)
                make.left.equalTo(10)
                make.bottom.equalToSuperview().offset(-5)
            }
            
            s.addSubview(saleLbl)
            saleLbl.text = "月销量5251件"
            saleLbl.snp.makeConstraints { (make) in
                make.right.equalTo(-10)
                make.left.equalTo(priceLbl.snp.right)
                make.centerY.equalTo(priceLbl.snp.centerY)
            }
            saleLbl.textAlignment = .right
        })
        
        let specsView = UIView().then { (v) in
            containerView.addSubview(v)
            v.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.top.equalTo(subView.snp.bottom).offset(6)
                make.height.equalTo(40)
            }
            v.backgroundColor = UIColor.white
            
            let specsLbl = UILabel().then { (s) in
                v.addSubview(s)
                s.snp.makeConstraints { (make) in
                    make.width.equalTo(80)
                    make.left.equalTo(10)
                    make.centerY.equalToSuperview()
                }
                s.text = "规格"
            }

            let specsficationLbl = UILabel().then { (s) in
                v.addSubview(s)
                s.snp.makeConstraints { (make) in
                    make.width.equalTo(120)
                    make.left.equalTo(specsLbl.snp.right).offset(12)
                    make.centerY.equalToSuperview()
                }
                s.text = "六斤装-约16个"
            }
        }
        
        let detailView = UIView().then { (v) in
            containerView.addSubview(v)
            v.snp.makeConstraints { (make) in
                make.top.equalTo(specsView.snp.bottom).offset(5)
                make.left.right.equalToSuperview()
                make.height.equalTo(20)
            }
            v.backgroundColor = UIColor.white
            
            let lbl = UILabel.init()
            v.addSubview(lbl)
            lbl.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(10)
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(100)
            }
            lbl.text = "商品评价"
            
            let more = UILabel.init()
            v.addSubview(more)
            more.snp.makeConstraints { (make) in
                make.right.equalToSuperview().offset(-10)
                make.top.bottom.equalToSuperview()
                make.left.equalTo(lbl.snp.right)
            }
            more.text = "更多"
            more.textAlignment = .right
        }
        
        var prevCell: DetailCell?
        for (index, _) in dataArr.enumerated() {
            let cell = DetailCell()
            containerView.addSubview(cell)

            if let prevCell = prevCell {
                cell.snp.makeConstraints { (make) in
                    make.width.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.height.equalTo(200)
                    make.top.equalTo(prevCell.snp.bottom).offset(5)
                    if index == dataArr.count - 1 {
                        make.bottom.equalToSuperview()
                    }
                }
            } else {
                cell.snp.makeConstraints { (make) in
                    make.width.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.top.equalTo(detailView.snp.bottom)
                    make.height.equalTo(200)
                }
            }

            prevCell = cell
            cell.imgVTap = { [weak self] in
                let vc = PictureVC()
                vc.hidesBottomBarWhenPushed = true
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

class DetailCell: UIView {
    
    var imgVTap: (() -> Void)?
    
    let avatar = UIImageView()
    let name = UILabel()
    let comment = UILabel()
    
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
        
        let line = UIView()
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalTo(0)
        }
        line.backgroundColor = UIColor.lightGray
        
        self.addSubview(avatar)
        avatar.snp.makeConstraints { (make) in
            make.width.height.equalTo(25)
            make.left.equalTo(12)
            make.top.equalTo(18)
        }
        avatar.backgroundColor = UIColor.cyan
        avatar.layer.cornerRadius = 3.0
        
        self.addSubview(name)
        name.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.centerY.equalTo(avatar.snp.centerY)
            make.left.equalTo(avatar.snp.right).offset(5)
            make.height.equalTo(20)
        }
        name.text = "thomas"
        
        self.addSubview(comment)
        comment.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(avatar.snp.bottom).offset(5)
            make.height.equalTo(60)
        }
        comment.text = "评价: ......"
        
        let imgStack = UIStackView()
        imgStack.axis = .horizontal
        imgStack.distribution = .fillEqually
        imgStack.spacing = 10.0
        self.addSubview(imgStack)
        imgStack.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(comment.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
        
        let imgV1 = UIImageView()
        let imgV2 = UIImageView()
        let imgV3 = UIImageView()
        let imgV4 = UIImageView()
        imgV1.layer.cornerRadius = 4.0
        imgV2.layer.cornerRadius = 4.0
        imgV3.layer.cornerRadius = 4.0
        imgV4.layer.cornerRadius = 4.0
        imgV1.image = UIImage.init(named: "11")
        imgV2.image = UIImage.init(named: "22")
        imgV3.image = UIImage.init(named: "11")
        imgV4.image = UIImage.init(named: "22")
        imgStack.addArrangedSubview(imgV1)
        imgStack.addArrangedSubview(imgV2)
        imgStack.addArrangedSubview(imgV3)
        imgStack.addArrangedSubview(imgV4)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(imgVTapped))
        imgStack.addGestureRecognizer(tap)
    }
    
    @objc func imgVTapped() {
        imgVTap!()
    }
}
