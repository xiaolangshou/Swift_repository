//
//  PictureVC.swift
//  WeeLinkPro1
//
//  Created by Liu Tao on 2020/5/24.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class PictureVC: UIViewController {

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
            imgV.tag = i
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(onTapImage(_:)))
            imgV.addGestureRecognizer(tap)
            imgV.isUserInteractionEnabled = true
            imgV.contentMode = .scaleToFill
        }
    }
    
    @objc func onTapImage(_ tap: UITapGestureRecognizer) {
        if let tag = tap.view?.tag {
            print(tag)
        }
    }

}

extension PictureVC: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.title = "\(page+1)/\(data.count)"
    }
}

