//
//  vvv.swift
//  ScrollViewDemo
//
//  Created by Thomas Lau on 2018/8/13.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

class vvv: UIView {

    var count: Int? {
        didSet {
            reload(count: count ?? 0)
        }
    }
    
    private var _scrollView = UIScrollView()
    private var _pageControl = UIPageControl()
    
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
        _scrollView.backgroundColor = UIColor.cyan
        
        self.addSubview(_pageControl)
        _pageControl.currentPage = 0
        _pageControl.pageIndicatorTintColor = UIColor.blue
        _pageControl.currentPageIndicatorTintColor = UIColor.red
    }
    
    func reload(count: Int) {
        
        layoutIfNeeded()
        
        _scrollView.frame = self.bounds
        _scrollView.delegate = self
        _scrollView.contentSize = CGSize(width: self.frame.size.width * CGFloat(count), height: self.frame.size.height)
        
        _pageControl.center.x = self.frame.size.width / 2
        _pageControl.frame.origin.y = self.frame.size.height - 10 + _pageControl.frame.size.height
        _pageControl.numberOfPages = count
    }
    
    
}

extension vvv: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        _pageControl.currentPage = page
    }
}
