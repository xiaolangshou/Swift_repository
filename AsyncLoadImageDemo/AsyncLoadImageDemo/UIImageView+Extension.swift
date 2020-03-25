//
//  UIImageView+Extension.swift
//  AsyncLoadImageDemo
//
//  Created by Thomas Lau on 2018/7/6.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

extension UIImageView {
    
    typealias Complete = (() -> Void)?
    
    func loadWebImage(imgUrl: String, complete: Complete) {
        if let url = URL.init(string: imgUrl) {
            let request = URLRequest.init(url: url)
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error.debugDescription)
                } else {
                    let img = UIImage.init(data: data ?? Data())
                    
                    DispatchQueue.main.async {
                        self.image = img
                    }
                    
                    complete?()
                }
            }) as URLSessionTask
            
            dataTask.resume()
        }
    }
}

/*
 */
