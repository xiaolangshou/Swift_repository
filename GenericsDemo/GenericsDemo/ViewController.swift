//
//  ViewController.swift
//  GenericsDemo
//
//  Created by Thomas Lau on 2020/9/26.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //self.demo1()
        //self.demo2()
        //self.demo3()
        self.demo4()
    }

    /// 用泛型实现两相同变量交换
    func demo1() {
        
        func swap<T>(_ a: inout T, _ b: inout T) {
            
            let temp = a
            a = b
            b = temp
            
            print("a: \(a), b: \(b)")
        }
        
        var a = 1
        var b = 2
        
        var c = "aaa"
        var d = "bbb"
        
        var i = [5,2,4]
        var j = [1,3,2]
        
        swap(&a, &b)
        swap(&c, &d)
        swap(&i, &j)
    }
    
    /// 用泛型实现“栈”
    func demo2() {
    
        struct Stack<T> {
            private var collection = Array<T>.init()
            var maxLength = 10
            
            var topElement: T? {
                return collection.isEmpty ? nil : collection.last
            }
            
            @discardableResult
            mutating func push(_ object: T) -> Bool {
                if collection.count < maxLength {
                    collection.append(object)
                    return true
                } else {
                    return false
                }
            }
            
            @discardableResult
            mutating func pop() -> T? {
                guard collection.count > 0 else { return nil }
                return collection.removeLast()
            }
        }
        
        // 调用
        var stack = Stack<UIViewController>.init()
        
        stack.push(UIViewController.init())
        stack.push(UIViewController.init())
        stack.push(UIViewController.init())
        stack.pop()
        print("stack: \(stack)")
        
        if let topElement = stack.topElement {
            print("top element: \(topElement)")
        }
    }
    
    /// 模仿dictionary定义个泛型字典
    func demo3() {
        
        struct Dic<Key: Hashable, Value> {
            private var data: [Key: Value]
            
            init(data:[Key: Value]) {
                self.data = data
            }
            
            subscript(key: Key) -> Value? {
                return data[key]
            }
        }
        
        let dic = Dic.init(data: ["name": "Thomas", "age": 29])
        let name = dic["name"]
        let age = dic["age"]
        print("name:\(name ?? ""), age:\(age ?? 0)")
    }
    
    /// 泛型实现UIIMageView图片下载
    func demo4() {
        let image = UIImageView()
        image.ci.setImage(url: URL.init(string: "https://www.manoboo.com")!, placeHolder: nil)
    }

}

// 新类型(泛型)
public final class CIImageKit<T> {
    
    public let base: T
    public init(_ base: T) {
        self.base = base
    }
}

// 新协议
public protocol CIImageDownloaderProtcol {
    
    associatedtype type
    var ci: type { get }
}

// 新协议里变量是新类型
public extension CIImageDownloaderProtcol {
    
    var ci: CIImageKit<Self> {
        get {
            return CIImageKit(self)
        }
    }
}

// 声明某个类遵守新协议
extension UIImageView: CIImageDownloaderProtcol {}

// 新类型（具体类型）
extension CIImageKit where T: UIImageView {
    func setImage(url: URL, placeHolder: UIImage?) {
        print(#function)
        print("url:\(url), placeHolder:\(placeHolder ?? UIImage.init())")
    }
}
