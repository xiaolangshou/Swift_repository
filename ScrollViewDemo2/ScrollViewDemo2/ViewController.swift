//
//  ViewController.swift
//  ScrollViewDemo2
//
//  Created by Thomas Lau on 2018/5/15.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tV = UITableView()
    var sV = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tV.frame = CGRect(x: 50, y: 100, width: 300, height: 200)
        tV.backgroundColor = UIColor.cyan
        tV.contentSize = CGSize(width: 300, height: 200)
        tV.alwaysBounceVertical = true
        tV.showsVerticalScrollIndicator = true
        // 控制控件遇到边框是否反弹
        tV.bounces = true
        tV.delegate = self
        tV.sectionHeaderHeight = 15
        self.view.addSubview(tV)
        
        sV.frame = CGRect.init(x: 0, y: 30, width: 200, height: 90)
        sV.backgroundColor = UIColor.blue
        sV.alwaysBounceVertical = true
        view.addSubview(sV)
        
        let btn = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 15))
        btn.text = "111"
        sV.addSubview(btn)
    }
    

}

extension ViewController: UITableViewDelegate, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = UIColor.red
        return v
    }
    
    func scrollViewDidScroll(_ tV: UIScrollView) {
        self.sV.setContentOffset(tV.contentOffset, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.sV.setContentOffset(scrollView.contentOffset, animated: true)
    }
}
