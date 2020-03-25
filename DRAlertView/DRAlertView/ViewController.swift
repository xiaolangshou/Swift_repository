//
//  ViewController.swift
//  DRAlertView
//
//  Created by dengrui on 16/6/12.
//  Copyright © 2016年 dengrui. All rights reserved.
//

import UIKit

class ViewController: UIViewController/*, YRPCommonModalViewDelegate */{

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupUI()
    }

    @IBAction func show(_ sender: Any) {
        let modalView = HPSolutionDetailShareView()
        modalView.show()
    }
    
//    private func setupUI() {
//        modalView.modalViewDelegate = self
//    }
    

//    func clickBtnWithIndexAndView(index:Int, arr: [String]) {
//        print(index)
//    }
    
}

