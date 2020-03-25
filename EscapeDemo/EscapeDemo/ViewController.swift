//
//  ViewController.swift
//  EscapeDemo
//
//  Created by Thomas Lau on 2018/6/20.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    typealias CallBack = (String) -> Void
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// method 1
//        getData { (p) in
//            print("p = \(p)")
//        }
        
        /// method 2
        let callback: CallBack = { p in
            print("p = \(p)")
        }
        getData(completion: callback)
    }
    
    func getData(completion: @escaping CallBack) {
        
        let urlStr = "http://207.148.109.195"
        
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print("data = \(String(describing: data))")
                let str = String(data: data!, encoding: String.Encoding.utf8)
                if let error = error {
                    print("error = \(error)")
                    return
                }
                completion(str!)
            }
            task.resume()
        }
    }
}

