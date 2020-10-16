//
//  ViewController.swift
//  GetStringBoundRect
//
//  Created by lian shan on 2020/10/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let sv = UILabel()
        sv.text = "20减18,hljhlhljhlk"
        sv.font = UIFont.boldSystemFont(ofSize: 14)

        self.view.addSubview(sv)

        let rect = getStrBoundRect(str: sv.text ?? "",
                                   font: sv.font,
                                   constrainedSize: CGSize(width: sv.frame.size.width,
                                                           height: sv.frame.size.height))
        print(rect.width)
    }


    func getStrBoundRect(str: String,
                         font: UIFont,
                         constrainedSize: CGSize,
                             option: NSStringDrawingOptions = .usesLineFragmentOrigin)->CGRect
    {
        let attr = [NSAttributedString.Key.font:font]
        let rect=str.boundingRect(with: constrainedSize, options: option, attributes:attr , context: nil)
        
        return rect
    }
}

