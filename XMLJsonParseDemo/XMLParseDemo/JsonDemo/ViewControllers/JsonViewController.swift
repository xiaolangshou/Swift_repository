//
//  ViewController.swift
//  XMLParseDemo
//
//  Created by Liu Tao on 2018/3/12.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class JsonViewController: UIViewController {

    static let sharedInstance = JsonViewController()

    fileprivate var _dataSource: RxTableViewSectionedReloadDataSource<SectionJsonModel>!
    fileprivate let _tableView = UITableView()

    fileprivate let _jsonViewModel = JsonViewModel()
    fileprivate let _disposebag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    fileprivate func setupTableView() {

        _dataSource = RxTableViewSectionedReloadDataSource<SectionJsonModel>(configureCell: {
            [weak self] (_, tableview, indexPath, element) -> UITableViewCell in
            guard let _ = self,
                let temp = tableview.dequeueReusableCell(withIdentifier: "cellID"),
                let cell = temp as? JsonTableViewCell else
            {
                return UITableViewCell()
            }

            if let name = element.message?.name
                , let message = element.message?.message
                , let id = element.message?.id
            {
                cell.textLabel?.text = "\(name) | \(message) | \(id)"
            }

            if let updated_at = element.message?.updated_at
                , let message_date = element.message?.message_date
                , let created_at = element.message?.created_at
            {
                cell.detailText = "\(updated_at) | \(message_date) | \(created_at)"
            }

            return cell
        })

        view.addSubview(_tableView)
        _tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        _tableView.register(JsonTableViewCell.self, forCellReuseIdentifier: "cellID")
        _tableView.backgroundColor = UIColor.groupTableViewBackground
        _tableView.rowHeight = 130

        _jsonViewModel.items.asDriver()
            .drive(_tableView.rx.items(dataSource: _dataSource))
            .disposed(by: _disposebag)
    }
}

