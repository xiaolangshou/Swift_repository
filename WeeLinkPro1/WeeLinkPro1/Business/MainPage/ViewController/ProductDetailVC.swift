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
        imgV.backgroundColor = UIColor.cyan
        
        let title = UILabel()
        self.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.top.equalTo(imgV.snp.bottom).offset(3)
            make.width.equalToSuperview()
            make.bottom.equalTo(0)
            make.centerX.equalToSuperview()
        }
        title.textAlignment = .center
        title.textColor = UIColor.hex(0x787878)
        title.font = UIFont.PFRegular(10.0)
        title.text = "收藏"
        
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
            make.height.equalTo(70)
        }
        bView.backgroundColor = UIColor.white
        
        bView.addSubview(consult)
        consult.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.width / 8)
        }
        
        bView.addSubview(collect)
        collect.snp.makeConstraints { (make) in
            make.left.equalTo(consult.snp.right).offset(10)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.width / 8)
        }
        
        bView.addSubview(cargo)
        cargo.snp.makeConstraints { (make) in
            make.left.equalTo(collect.snp.right).offset(10)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.width / 8)
        }
        
        bView.addSubview(purchaseBtn)
        purchaseBtn.snp.makeConstraints { (make) in
            make.width.equalTo(94)
            make.height.equalTo(40)
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
        }
        purchaseBtn.layer.cornerRadius = 6.0
        purchaseBtn.backgroundColor = UIColor.hex(0x787878)
        purchaseBtn.setTitle("立即购买", for: UIControl.State.normal)
        purchaseBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        purchaseBtn.titleLabel?.font = UIFont.PFBold(14.0)
        
        bView.addSubview(cargoBtn)
        cargoBtn.snp.makeConstraints { (make) in
            make.width.equalTo(94)
            make.height.equalTo(40)
            make.right.equalTo(purchaseBtn.snp.left).offset(-10)
            make.centerY.equalToSuperview()
        }
        cargoBtn.layer.cornerRadius = 6.0
        cargoBtn.backgroundColor = UIColor.hex(0x787878)
        cargoBtn.setTitle("加入购物车", for: UIControl.State.normal)
        cargoBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        cargoBtn.titleLabel?.font = UIFont.PFBold(14.0)
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
            nameLbl.font = UIFont.PFMedium(20.0)
            nameLbl.textColor = UIColor.hex(0x787878)
            
            s.addSubview(numLbl)
            numLbl.text = "16（只）"
            numLbl.snp.makeConstraints { (make) in
                make.left.equalTo(10)
                make.top.equalTo(nameLbl.snp.bottom).offset(5)
                make.width.equalTo(90)
                make.height.equalTo(20)
            }
            numLbl.textColor = UIColor.hex(0x787878)
            numLbl.font = UIFont.PFRegular(17.0)
            
            s.addSubview(detailLbl)
            detailLbl.text = "副内容"
            detailLbl.snp.makeConstraints { (make) in
                make.left.equalTo(numLbl.snp.right).offset(5)
                make.right.equalTo(-10)
                make.centerY.equalTo(numLbl.snp.centerY)
                make.height.equalTo(20)
            }
            detailLbl.textColor = UIColor.hex(0x787878)
            detailLbl.font = UIFont.PFRegular(17.0)
            
            let aStr = NSMutableAttributedString.init(string: "￥32.5 ￥38.5")
            aStr.addAttribute(NSAttributedString.Key.font,
                              value: UIFont.PFRegular(20),
                              range: NSRange.init(location: 1, length: 5))
            aStr.addAttribute(NSAttributedString.Key.font,
                              value: UIFont.PFRegular(14),
                              range: NSRange.init(location: 6, length: 5))
            aStr.addAttribute(NSAttributedString.Key.strikethroughStyle,
                              value: NSNumber.init(value: 1),
                              range: NSRange.init(location: 6, length: 5))
            s.addSubview(priceLbl)
            priceLbl.attributedText = aStr
            priceLbl.snp.makeConstraints { (make) in
                make.width.equalTo(110)
                make.height.equalTo(20)
                make.left.equalTo(10)
                make.bottom.equalToSuperview().offset(-5)
            }
            priceLbl.textColor = UIColor.hex(0x787878)
            
            s.addSubview(saleLbl)
            saleLbl.text = "月销量5251件"
            saleLbl.snp.makeConstraints { (make) in
                make.right.equalTo(-10)
                make.left.equalTo(priceLbl.snp.right)
                make.centerY.equalTo(priceLbl.snp.centerY)
            }
            saleLbl.textAlignment = .right
            saleLbl.textColor = UIColor.hex(0x787878)
            saleLbl.font = UIFont.PFRegular(14.0)
        })
        
        let specsView = UIView().then { (v) in
            containerView.addSubview(v)
            v.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.top.equalTo(subView.snp.bottom).offset(10)
                make.height.equalTo(50)
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
                s.textColor = UIColor.hex(0x787878)
                s.font = UIFont.PFRegular(15.0)
            }

            let specsficationLbl = UILabel().then { (s) in
                v.addSubview(s)
                s.snp.makeConstraints { (make) in
                    make.width.equalTo(120)
                    make.left.equalTo(specsLbl.snp.right).offset(12)
                    make.centerY.equalToSuperview()
                }
                s.text = "六斤装-约16个"
                s.textColor = UIColor.hex(0x787878)
                s.font = UIFont.PFRegular(14.0)
            }
            
            let arrow = UIImageView().then { (a) in
                v.addSubview(a)
                a.snp.makeConstraints { (make) in
                    make.width.equalTo(12)
                    make.height.equalToSuperview()
                    make.right.equalTo(-15)
                }
                a.backgroundColor = UIColor.cyan
            }
        }
        
        let detailView = UIView().then { (v) in
            containerView.addSubview(v)
            v.snp.makeConstraints { (make) in
                make.top.equalTo(specsView.snp.bottom).offset(10)
                make.left.right.equalToSuperview()
                make.height.equalTo(40)
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
            lbl.textColor = UIColor.hex(0x787878)
            lbl.font = UIFont.PFRegular(14.0)
            
            let more = UILabel.init()
            v.addSubview(more)
            more.snp.makeConstraints { (make) in
                make.right.equalToSuperview().offset(-10)
                make.top.bottom.equalToSuperview()
                make.left.equalTo(lbl.snp.right)
            }
            more.text = "更多"
            more.textAlignment = .right
            more.textColor = UIColor.hex(0x787878)
            more.font = UIFont.PFRegular(14.0)
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
    let date = UILabel()
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
            make.height.equalTo(SINGLE_LINE_WIDTH)
            make.top.equalTo(SINGLE_LINE_ADJUST_OFFSET)
        }
        line.backgroundColor = UIColor.systemBackColor
        
        self.addSubview(avatar)
        avatar.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.left.equalTo(12)
            make.top.equalTo(18)
        }
        avatar.backgroundColor = UIColor.cyan
        avatar.layer.cornerRadius = 3.0
        
        self.addSubview(name)
        name.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.centerY.equalTo(avatar.snp.centerY)
            make.left.equalTo(avatar.snp.right).offset(10)
            make.height.equalTo(20)
        }
        name.text = "thomas"
        name.textColor = UIColor.hex(0x787878)
        name.font = UIFont.PFRegular(16.0)
        
        self.addSubview(date)
        date.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.centerY.equalTo(avatar.snp.centerY)
            make.height.equalToSuperview()
        }
        date.text = "2020-5-31"
        date.textAlignment = .right
        date.textColor = UIColor.hex(0x787878)
        date.font = UIFont.PFRegular(14.0)
        
        self.addSubview(comment)
        comment.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(avatar.snp.bottom).offset(5)
            make.height.equalTo(60)
        }
        comment.text = "评价: ................................................................................................................."
        comment.textColor = UIColor.hex(0x787878)
        comment.font = UIFont.PFRegular(14.0)
        comment.lineBreakMode = .byWordWrapping
        comment.numberOfLines = 0
        
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
