//
//  Banner.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/15.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class Banner: UIView {
    
    var onClickBanner: ((Int) -> Void)?
    
    var count: Int? {
        didSet {
            reload(count: count ?? 0)
        }
    }
    
    var imageArray = [UIImage]()
    private var _scrollView = UIScrollView()
    
    private let _pageControl = UIPageControl()
    
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
    }
    
    func reload(count: Int) {
        
        layoutIfNeeded()
        
        _scrollView.frame = self.bounds
        _scrollView.delegate = self
        _scrollView.contentSize = CGSize(width: self.frame.size.width * CGFloat(count), height: self.frame.size.height)
        
        guard imageArray.count != 0 else { return }
        for i in 0..<count {
            let imgV = UIImageView(frame: CGRect(x: CGFloat(i) * CGFloat(UIScreen.main.bounds.size.width), y: 0, width: self.frame.size.width, height: self.frame.size.height))
            imgV.image = imageArray[i]
            _scrollView.addSubview(imgV)
            imgV.tag = i
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(onTapImage(_:)))
            imgV.addGestureRecognizer(tap)
            imgV.isUserInteractionEnabled = true
        }
        
        _pageControl.center.x = self.frame.size.width / 2
        _pageControl.frame.origin.y = self.frame.size.height - 10 + _pageControl.frame.size.height
        _pageControl.numberOfPages = count
    }
    
    @objc func onTapImage(_ tap: UITapGestureRecognizer) {
        if let tag = tap.view?.tag {
            self.onClickBanner?(tag)
            print(tag)
        }
    }
}

extension Banner: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        _pageControl.currentPage = page
    }
}
