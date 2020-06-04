//
//  Banner.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/15.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class Banner: UIView {
    
    enum BannerType {
        case pageCon
        case rightCorn
    }
    
    var onClickBanner: ((Int) -> Void)?
    
    var count: Int? {
        didSet {
            reload(count: count ?? 0)
        }
    }
    
    var type: BannerType? {
        didSet {
            typeSelect()
        }
    }
    
    var imageArray = [UIImage]()
    private var scrollView = UIScrollView()
    private let pageControl = UIPageControl()
    private let pageIcon = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
    }

    private func setupView() {
        
        self.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.alwaysBounceHorizontal = true
        scrollView.isPagingEnabled = true
        
        self.addSubview(pageControl)
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.blue
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.setValue(UIImage(named: "banner_unselected"), forKey: "_pageImage")
        pageControl.setValue(UIImage(named: "banner_selected"), forKey: "_currentPageImage")
        
        self.addSubview(pageIcon)
        pageIcon.backgroundColor = UIColor.hex(0x5F6062)
        pageIcon.layer.cornerRadius = 8.0
        pageIcon.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(20)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
        pageIcon.setTitle("1/\(imageArray.count)", for: .normal)
        pageIcon.setTitleColor(UIColor.white, for: .normal)
        pageIcon.titleLabel?.font = UIFont.PFExtraLight(11)
    }
    
    func reload(count: Int) {
        
        layoutIfNeeded()
        
        scrollView.frame = self.bounds
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: self.frame.size.width * CGFloat(count), height: self.frame.size.height)
        
        guard imageArray.count != 0 else { return }
        for i in 0..<count {
            let imgV = UIImageView(frame: CGRect(x: CGFloat(i) * CGFloat(UIScreen.width), y: 0, width: self.frame.size.width, height: self.frame.size.height))
            imgV.image = imageArray[i]
            scrollView.addSubview(imgV)
            imgV.tag = i
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(onTapImage(_:)))
            imgV.addGestureRecognizer(tap)
            imgV.isUserInteractionEnabled = true
            imgV.contentMode = .scaleToFill
        }
        
        pageControl.center.x = self.frame.size.width / 2
        pageControl.frame.origin.y = self.frame.size.height - 10 + pageControl.frame.size.height
        pageControl.numberOfPages = count
        pageIcon.setTitle("1/\(imageArray.count)", for: .normal)
    }
    
    @objc func onTapImage(_ tap: UITapGestureRecognizer) {
        if let tag = tap.view?.tag {
            self.onClickBanner?(tag)
            print(tag)
        }
    }
    
    func typeSelect() {
        if type == .pageCon {
            pageControl.isHidden = false
            pageIcon.isHidden = true
        } else {
            pageControl.isHidden = true
            pageIcon.isHidden = false
        }
    }
}

extension Banner: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = page
        pageIcon.setTitle("\(page + 1)/\(imageArray.count)", for: .normal)
    }
}
