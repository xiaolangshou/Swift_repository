//
//  PictureVC.swift
//  WeeLinkPro1
//
//  Created by Liu Tao on 2020/5/24.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class PictureVC: UIViewController {

    let bottomView = UITextView()
    let scrollView = UIScrollView()
    var data = [1,1,1,1]
    var imageArray: [UIImage] = [UIImage.init(named: "11")!,
                                 UIImage.init(named: "22")!,
                                 UIImage.init(named: "11")!,
                                 UIImage.init(named: "22")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.PFBold(18.0)]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = nil
    }
    
    func configBackBtn() {

          // 返回按钮
          let backButton = UIButton(type: .custom)
          // 给按钮设置返回箭头图片
          backButton.setImage(UIImage(named: "nav_back"), for: .normal)
          // 设置frame
          backButton.frame = CGRect(x: 200, y: 13, width: 18, height: 18)
          backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
          // 自定义导航栏的UIBarButtonItem类型的按钮
          let backView = UIBarButtonItem(customView: backButton)
          // 重要方法，用来调整自定义返回view距离左边的距离
          let barButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
          barButtonItem.width = -5
          // 返回按钮设置成功
          navigationItem.leftBarButtonItems = [barButtonItem, backView]
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupView() {
        
        self.title = "1/\(data.count)"
        
        configBackBtn()
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: UIScreen.width * CGFloat(data.count),
                                        height: 0)
        
        guard imageArray.count != 0 else { return }
        for i in 0..<data.count {
            let imgV = UIImageView(frame: CGRect(x: CGFloat(i) * CGFloat(UIScreen.width),
                                                 y: -UIScreen.navBarHeight,
                                                 width: UIScreen.width,
                                                 height: UIScreen.height))
            imgV.image = imageArray[i]
            imgV.contentMode = .scaleToFill
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(imgVTapped))
            scrollView.addGestureRecognizer(tap)
            
            scrollView.addSubview(imgV)
        }
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            if UIDevice.isPhoneX {
                make.height.equalTo(86 + UIScreen.safeAreaBottomHeight)
            } else {
                make.height.equalTo(86)
            }
        }
        bottomView.backgroundColor = UIColor.black
        bottomView.alpha = 0.5
        bottomView.text = "评价：又实惠，老板还送了一些很实用的小礼品小礼品小礼品小便宜又实惠，老板还送了一些很实用的小礼品小礼品小礼实用的小礼品小礼品小礼实用的小礼品小礼品小礼实用的小礼品小礼品小礼实用的小礼品小礼品小礼。"
        bottomView.textColor = UIColor.white
        bottomView.font = UIFont.PFMedium(13.0)
    }
    
    @objc func imgVTapped() {
        
        navigationController?.navigationBar.isHidden = !(navigationController?.navigationBar.isHidden)!
        bottomView.isHidden = !bottomView.isHidden
    }
}

extension PictureVC: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.title = "\(page+1)/\(data.count)"
    }
}

