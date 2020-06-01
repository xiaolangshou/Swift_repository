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
    private var _scrollView = UIScrollView()
    private let _pageControl = UIPageControl()
    private let _pageIcon = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
    }

    private func setupView() {
        
        self.addSubview(_scrollView)
        _scrollView.delegate = self
        _scrollView.alwaysBounceHorizontal = true
        _scrollView.isPagingEnabled = true
        
        self.addSubview(_pageControl)
        _pageControl.currentPage = 0
        _pageControl.pageIndicatorTintColor = UIColor.blue
        _pageControl.currentPageIndicatorTintColor = UIColor.red
        _pageControl.setValue(UIImage(named: "banner_unselected"), forKey: "_pageImage")
        _pageControl.setValue(UIImage(named: "banner_selected"), forKey: "_currentPageImage")
        
        self.addSubview(_pageIcon)
        _pageIcon.backgroundColor = UIColor.hex(0x5F6062)
        _pageIcon.layer.cornerRadius = 8.0
        _pageIcon.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(20)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
        _pageIcon.setTitle("1/\(imageArray.count)", for: .normal)
        _pageIcon.setTitleColor(UIColor.white, for: .normal)
        _pageIcon.titleLabel?.font = UIFont.PFExtraLight(11)
    }
    
    func reload(count: Int) {
        
        layoutIfNeeded()
        
        _scrollView.frame = self.bounds
        _scrollView.delegate = self
        _scrollView.contentSize = CGSize(width: self.frame.size.width * CGFloat(count), height: self.frame.size.height)
        
        guard imageArray.count != 0 else { return }
        for i in 0..<count {
            let imgV = UIImageView(frame: CGRect(x: CGFloat(i) * CGFloat(UIScreen.width), y: 0, width: self.frame.size.width, height: self.frame.size.height))
            imgV.image = imageArray[i]
            _scrollView.addSubview(imgV)
            imgV.tag = i
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(onTapImage(_:)))
            imgV.addGestureRecognizer(tap)
            imgV.isUserInteractionEnabled = true
            imgV.contentMode = .scaleToFill
        }
        
        _pageControl.center.x = self.frame.size.width / 2
        _pageControl.frame.origin.y = self.frame.size.height - 10 + _pageControl.frame.size.height
        _pageControl.numberOfPages = count
        _pageIcon.setTitle("1/\(imageArray.count)", for: .normal)
    }
    
    @objc func onTapImage(_ tap: UITapGestureRecognizer) {
        if let tag = tap.view?.tag {
            self.onClickBanner?(tag)
            print(tag)
        }
    }
    
    func typeSelect() {
        if type == .pageCon {
            _pageControl.isHidden = false
            _pageIcon.isHidden = true
        } else {
            _pageControl.isHidden = true
            _pageIcon.isHidden = false
        }
    }
}

extension Banner: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        _pageControl.currentPage = page
        _pageIcon.setTitle("\(page + 1)/\(imageArray.count)", for: .normal)
    }
}
