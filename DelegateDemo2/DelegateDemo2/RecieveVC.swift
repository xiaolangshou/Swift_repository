//
//  ViewController.swift
//  DelegateDemo2
//
//  Created by Liu Tao on 2018/11/21.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tlTableView = TLTableView()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        
        tlTableView.dataSource = self
        tlTableView.delegate = self
        tlTableView.frame = CGRect.init(x: 50, y: 100, width: 200, height: 300)
        view.addSubview(tlTableView)
        tlTableView.reload()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.yellow
        tableView.frame = CGRect.init(x: 60, y: 450, width: 200, height: 200)
        view.addSubview(tableView)
    }

}

extension ViewController: theDataSource, theDelegate {
    
    func numberOfRowsInTableView() {
        print("number of rows in table view")
    }
    
    func didSelectViewAtIndexPath() {
        print("did select view at index path")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = UIColor.lightGray
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    // delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select row at index path \(indexPath.row)")
    }
}

