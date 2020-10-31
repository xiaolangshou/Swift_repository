//
//  ViewController.swift
//  CalculateTextHeight
//
//  Created by Thomas Lau on 2020/10/31.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let lbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(lbl)
        
        lbl.text = "asdfjlaksdjflakjjjjjjjjjjjjjjj\n\nadklsjflaskdjflkasjdflkasjdflkjasdklfjaslkdflkasdflasdfsahdajdskfjaklsjdfklsjdflasjdflkajsdflkjalk\n\nsdjflaksjdflksjdflkasdjlkfajsdflkajsdlkfjaklsdjfldsjflkasdjflkasjdlfkjadslkdfjkladjflkadsjflksa\n\ndjflkajsdfkljaskdfjlaskjdflkasdjfklsajflksdfliasduitrutgjkdbv;kadfhpasidfhiasdjfsdjfo;i\n\nsdjgfhdskjgasdog[oiadshgsdfj;aldskhflasdjfiu[qeuthkjfl;asdkjflksdjfldksjf\n\ndls;kjflksdjflsdjfadgdufidsfjsdnvskdvmds"
        
        getH1()
        getH2()
        getH3()
    }
    
    // 只能计算单行高度
    func getH1() {
        
        let h = lbl.sizeThatFits(CGSize.init(width: 50, height: CGFloat(MAXFLOAT))).height
        
        print(h)
    }
    
    // 只能计算单行高度
    func getH2() {
        
        lbl.preferredMaxLayoutWidth = 200
        
        let h = lbl.intrinsicContentSize.height
        
        print(h)
    }
    
    //先算出文本宽度，再除以单行高度(不能识别换行符)
    func getH3() {
        
        let str = lbl.text!.replacingOccurrences(of: "\n", with: "")
        let aStr = NSAttributedString.init(string: str)
        let w = aStr.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 15),
                                                 options: .usesLineFragmentOrigin,
            context: nil).width

        let h = lbl.intrinsicContentSize.height * (w / 50)

        print(h)
    }


}

