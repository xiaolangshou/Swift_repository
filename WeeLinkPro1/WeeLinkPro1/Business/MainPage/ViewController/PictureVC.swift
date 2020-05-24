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
    
    func setupView() {
        
        self.title = "1/\(data.count)"
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: UIScreen.width * CGFloat(data.count), height: UIScreen.height)
        
        guard imageArray.count != 0 else { return }
        for i in 0..<data.count {
            let imgV = UIImageView(frame: CGRect(x: CGFloat(i) * CGFloat(UIScreen.width), y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
            imgV.image = imageArray[i]
            scrollView.addSubview(imgV)
            imgV.contentMode = .scaleToFill
        }
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
        bottomView.backgroundColor = UIColor.black
        bottomView.alpha = 0.5
        bottomView.text = "你好，我的名字叫thomas，请多多指教爱上了的看法建安路快速的减肥啦开始的减肥拉斯科技的分类考试江东父老开始减肥的"
        bottomView.textColor = UIColor.white
    }

}

extension PictureVC: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.title = "\(page+1)/\(data.count)"
    }
}

