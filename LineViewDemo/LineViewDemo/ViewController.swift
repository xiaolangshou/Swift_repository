//
//  ViewController.swift
//  LineViewDemo
//
//  Created by lian shan on 2020/10/26.
//

import UIKit

class ViewController: UIViewController {
    
    //线宽
    let lineWidth = 1 / UIScreen.main.scale
     
    //线偏移量
    let lineAdjustOffset = 1 / UIScreen.main.scale / 2

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cv = UIScrollView.init(frame: UIScreen.main.bounds)
        cv.backgroundColor = UIColor.cyan
        cv.alwaysBounceVertical = true
        cv.isScrollEnabled = true
        view.addSubview(cv)
        
        let cgView = UIView(frame: CGRect(x: 30, y: 100, width: 180, height: lineWidth + lineAdjustOffset))
        cgView.backgroundColor = UIColor.red
        cv.addSubview(cgView)
        
    }


}

class CGView: UIView {
     
    //线宽
    let lineWidth = 1 / UIScreen.main.scale
     
    //线偏移量
    let lineAdjustOffset = 1 / UIScreen.main.scale / 2
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        //设置背景色为透明，否则是黑色背景
        self.backgroundColor = UIColor.clear
    }
     
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func draw(_ rect: CGRect) {
        super.draw(rect)
         
        //获取绘图上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
         
        //创建一个矩形，它的所有边都内缩固定的偏移量
        let drawingRect = self.bounds.insetBy(dx: lineAdjustOffset, dy: lineAdjustOffset)
         
        //创建并设置路径
        let path = CGMutablePath()
        //外边框
        path.addRect(drawingRect)
        //横向分隔线(中点同样要计算偏移量)
        let midY = CGFloat(Int(self.bounds.midY)) + lineAdjustOffset
        path.move(to: CGPoint(x: drawingRect.minX, y: midY))
        path.addLine(to: CGPoint(x: drawingRect.maxX, y: midY))
        //纵向分隔线(中点同样要计算偏移量)
        let midX = CGFloat(Int(self.bounds.midX)) + lineAdjustOffset
        path.move(to: CGPoint(x: midX, y: drawingRect.minY))
        path.addLine(to: CGPoint(x: midX, y: drawingRect.maxY))
         
        //添加路径到图形上下文
        context.addPath(path)
         
        //设置笔触颜色
        context.setStrokeColor(UIColor.black.cgColor)
        //设置笔触宽度
        context.setLineWidth(lineWidth)
 
        //绘制路径
        context.strokePath()
    }
}
