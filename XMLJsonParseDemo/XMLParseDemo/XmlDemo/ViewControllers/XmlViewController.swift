//
//  XmlViewController.swift
//  XMLParseDemo
//
//  Created by Liu Tao on 2018/3/14.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class XmlViewController: UIViewController {

    static let sharedInstance = XmlViewController()

    fileprivate var _xmlViewModel = XmlViewModel()
    fileprivate var _tableView = UITableView()
    fileprivate let _disposebag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        listeningData()
    }

    deinit {
        print("1111111")
    }

    fileprivate func listeningData() {
        /*
        _xmlViewModel.updateTableView = { [weak self] in
            self?._tableView.reloadData()
        }
        _xmlViewModel.parsingXmlUsingAlamofire()*/

        _xmlViewModel._resultArray.asObservable().subscribe { [weak self] (value) in
            self?._tableView.reloadData()
        }.disposed(by: _disposebag)
    }

    fileprivate func setupTableView() {
        view.addSubview(_tableView)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.register(XmlTableViewCell.self, forCellReuseIdentifier: "cellID")
        _tableView.rowHeight = 130
        _tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

extension XmlViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _xmlViewModel._resultArray.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let xmlTableViewCell = cell as? XmlTableViewCell else {
            return
        }

        let array = _xmlViewModel._resultArray.value

        xmlTableViewCell.labelText = "\(array[indexPath.row].name) | \(array[indexPath.row].type) | \(array[indexPath.row].language) | \(array[indexPath.row].version)"
        xmlTableViewCell.detailText = "\(array[indexPath.row].size) | \(array[indexPath.row].thumnailUrl) | \(array[indexPath.row].contentUrl) | \(array[indexPath.row].model)"
    }

}
