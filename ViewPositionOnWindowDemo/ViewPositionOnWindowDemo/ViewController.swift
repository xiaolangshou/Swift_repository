//
//  ViewController.swift
//  ViewPositionOnWindowDemo
//
//  Created by lian shan on 2021/5/17.
//

import UIKit

class ViewController: UIViewController {

    let topView = UIView.init(frame: .init(x: 100, y: 100, width: 100, height: 100))
    let sV = UIScrollView.init(frame: .init(x: 10, y: 100, width: 400, height: 500))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(sV)
        sV.backgroundColor = UIColor.yellow

        sV.addSubview(topView)
        topView.backgroundColor = UIColor.cyan

//        view.addSubview(topView)
//        topView.backgroundColor = UIColor.cyan

        print(topView.frame.origin)
//        print("\n")
//        print(topView.zhmfPositionInScreen())
    }


}


extension UIView {

    func zhmfPositionInScreen() -> CGPoint {
        /// 先判断是否有父视图，如果没有父视图，直接返回视图的位置就行
        if let superView = self.superview {
            /**
            判断父视图是否是UIScrollView或者继承自UIScrollView

            先使用视图在屏幕上的位置使用视图的位置与父视图的位置X与Y分别相加

             如果父视图不是UIScrollView并且不继承自UIScrollView，则直接返回结果

             如果父视图是UIScrollView或者继承自UIScrollView

             还需要分别减去UIScrollView的scrollViewOffset.x和scrollViewOffset.y，然后返回结果
            */
            if let scrollView = superView as? UIScrollView {
                let position = CGPoint.init(x: self.frame.origin.x, y: self.frame.origin.y)
                let superPosition = superView.zhmfPositionInScreen()
                let scrollViewOffset = scrollView.contentOffset
                return CGPoint.init(x: superPosition.x + position.x - scrollViewOffset.x , y: superPosition.y + position.y - scrollViewOffset.y)
            } else {
                let superPosition = superView.zhmfPositionInScreen()
                let position = self.frame.origin
                return CGPoint.init(x: superPosition.x + position.x, y: superPosition.y + position.y)
            }
        } else {
            return self.frame.origin
        }
    }
}
