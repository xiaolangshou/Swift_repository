//
//  ViewController.swift
//  RunLoopDemo2
//
//  Created by lian shan on 2021/5/17.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView.init(frame: CGRect.init(x: 10,
                                                          y: 100,
                                                          width: UIScreen.main.bounds.width - 20,
                                                          height: 400))

    var num = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupScrollView()
        setupTimer()
    }


    func setupScrollView() {

        view.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.cyan
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.contentSize = CGSize.init(width: UIScreen.main.bounds.width - 20, height: 600)
    }

    func setupTimer() {

        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(run), userInfo: nil, repeats: true)

        // 改变定时器的mode为commonmodel，可以让定时器运行在defaultMode和trackingModel两种模式下，不会出现滚动scrollview导致定时器失效的故障
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
    }

    @objc func run() {
        num += 1
        print(Thread.current ,num)
    }
}

