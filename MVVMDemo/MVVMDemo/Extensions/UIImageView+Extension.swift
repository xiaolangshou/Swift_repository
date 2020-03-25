//
//  UIImageView+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    typealias CompletionBlock = (UIImage?) -> Void
    
    /// 加载网络图片
    ///
    /// - Parameters:
    ///   - path: 图片的 url
    ///   - placeImage: 默认图片
    ///   - complete: 完成的回调
    ///   - log: 打印加载过程的 log
    func loadImage(path: String?,
                   placeImage: UIImage? = nil,
                   complete: CompletionBlock? = nil,
                   log: Bool = false)
    {
        guard let path = path else {
            self.image = placeImage
            complete?(placeImage)
            
            return
        }
        
        let progress: DownloadProgressBlock = { (get, total) in
            if log {
                print("get: \(get) total: \(total) loading: \(path)")
            }
        }
        
        let completionHandler: CompletionHandler? = { (img, error, cacheType, url) in
            if let size = img?.size, size == CGSize.init(width: 1, height: 1) {
                self.image = placeImage
            }
            complete?(img)
        }
        
        let ops: [KingfisherOptionsInfoItem] = []
        
        self.kf.setImage(with: path.url,
                         placeholder: placeImage,
                         options: ops,
                         progressBlock: progress,
                         completionHandler: completionHandler)
    }
    
    func loadGIF(with url: URL, autoPlay: Bool = false) {
        
        self.kf.setImage(with: url,
                         placeholder: nil,
                         options: nil,
                         progressBlock: nil)
        { (img, error, cacheType, imgUrl) in
            if let gif = img {
                self.animationImages = gif.images
                self.animationDuration = gif.duration
                self.animationRepeatCount = 0
                self.image = gif.images?.first
                if autoPlay {
                    self.startAnimating()
                }
            }
        }
    }
    
    
}
