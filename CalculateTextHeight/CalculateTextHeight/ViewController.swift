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
    
    func getH1() {
        
        let h = lbl.sizeThatFits(CGSize.init(width: 50, height: CGFloat(MAXFLOAT))).height
        
        print(h)
    }
    
    func getH2() {
        
        lbl.preferredMaxLayoutWidth = 200
        
        let h = lbl.intrinsicContentSize.height
        
        print(h)
    }
    
    func getH3() {
        
        //先算出文本宽度
        let w = lbl.attributedText?.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 15),
                                                 options: .usesLineFragmentOrigin,
            context: nil).width

        let h = lbl.intrinsicContentSize.height * (w! / 50)

        print(h)
    }


}

