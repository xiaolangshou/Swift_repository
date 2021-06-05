//
//  ViewController.swift
//  SixPrincipleDemo3
//
//  Created by lian shan on 2021/6/4.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let bookStore = BookStore.init()
        bookStore.sellBook()
    }
}
class BookStore {
    var bookList: [NovelBook] = []
    init() { setupData()}
    func setupData() { // 1. NovelBook -----> OffNovelBook
        bookList.append(OffNovelBook.init(name: "天龙八部", price: 2000, author: "金庸"))
        bookList.append(OffNovelBook.init(name: "巴黎圣母院", price: 600, author: "雨果"))
        bookList.append(OffNovelBook.init(name: "悲惨世界", price: 3500, author: "雨果"))
    }
    func sellBook() { for book in bookList {  print("卖出 \(book.getName()), 价格：\(book.getPrice()), 作者：\(book.getAuthor())") } }
}
class IBook {
    init() {}
    func getName() -> String { return "" }
    func getPrice() -> CGFloat { return 0 }
    func getOffPrice() -> CGFloat { return 0 }
    func getAuthor() -> String { return "" }
}
class NovelBook: IBook {
    private var name = ""
    private var price: CGFloat = 0
    private var author = ""
    init(name: String, price: CGFloat, author: String) {
        self.name = name
        self.price = price
        self.author = author
    }
    override func getName() -> String { return name }
    override func getPrice() -> CGFloat { return price }
    override func getAuthor() -> String { return author }
}
class OffNovelBook: NovelBook { // 2. 对NovelBook进行扩展，专门用于打折出售，在不改动原有类的前提下添加了打折功能
    override init(name: String, price: CGFloat, author: String) {  super.init(name: name, price: price, author: author)  }
    override func getPrice() -> CGFloat {
        let price = super.getPrice()
        return price * 0.8
    }
}
