//
//  DateCalendarView.swift
//  Soccer
//
//  Created by Thomas Lau on 2018/4/20.
//  Copyright © 2018年 追球体育. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class ShowData {
    var number = String()
    var isSelect = false
    
    init(number: String, isSelect: Bool) {
        self.number = number
        self.isSelect = isSelect
    }
}

class DateCalendarView: UIView {

    var selectedIndex = Int(0) {
        didSet {
            var index = selectedIndex
            for date in _dateArray {
                if date.number == "" {
                    index += 1
                }
            }
            _collectionView?.selectItem(at: IndexPath(row: index, section: 1),
                                        animated: true,
                                        scrollPosition: .top)
        }
    }
    
    var cellTap: ((DateCalendarView, Int) -> Void)?
    
    fileprivate var _subTapGesture = UITapGestureRecognizer()
    fileprivate var _weekArray = ["日", "一", "二", "三", "四", "五", "六"]
    fileprivate var _dateArray = [ShowData]()
    fileprivate var _collectionView: UICollectionView?
    fileprivate var _currentSelectIndex = Int(0)
    fileprivate var _defaultSelectIndex = Int(0)
    fileprivate var _selectYear = Date.currentYear()
    fileprivate var _selectMonth = Date.currentMonth()
    fileprivate var _isFirstLoad = true
    
    fileprivate let _leftButton = UIButton()
    fileprivate let _rightButton = UIButton()
    fileprivate let _bottomButton = UIButton()
    fileprivate let _monthLabel = UILabel()
    fileprivate let _cellReuseIdentifier = "DateCalendarCell"
    fileprivate let _disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    fileprivate func setupView() {
        
        setupData()
        setupTopView()
        setupBottomButton()
        setupCollectionView()
    }
    
    fileprivate func setupCalendarViewDates(year: Int, month: Int) {
        
        var pickDates = [Date]()
        var pickStr = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        let startDate = Date.startOfMonth(year: year, month: month)
        let numOfDays = Date.getCountOfDaysInMonth(year: year, month: month)
        
        for i in 0..<numOfDays {
            pickDates.append(Date.getDate(startDate: startDate,
                                          monthsToAdd: 0,
                                          daysToAdd: i))
        }
        
        for date in pickDates {
            if DateUtil.isToday(date) {
                pickStr = "今天"
                _dateArray.append(ShowData(number: pickStr, isSelect: true))
            } else {
                pickStr = Date.dateToDateString(date, dateFormat: "dd")
                _dateArray.append(ShowData(number: pickStr, isSelect: false))
            }
        }
    }
    
    fileprivate func setupData() {
        
        _dateArray.removeAll()
        
        setupCalendarViewDates(year: _selectYear, month: _selectMonth)
    
        switch DateUtil.getCNWeekDayStringFromDate(Date.startOfMonth(year: _selectYear, month: _selectMonth)) {
        case "星期一":
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 0)
        case "星期二":
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 0)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 1)
        case "星期三":
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 0)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 1)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 2)
        case "星期四":
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 0)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 1)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 2)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 3)
        case "星期五":
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 0)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 1)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 2)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 3)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 4)
        case "星期六":
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 0)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 1)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 2)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 3)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 4)
            _dateArray.insert(ShowData(number: "", isSelect: false), at: 5)
        default: break
        }
    }
    
    fileprivate func setupTopView() {
        
        self.backgroundColor = UIColor.white
        
        _monthLabel.text = "\(Date.currentYear()) 年 \(Date.currentMonth()) 月"
        _monthLabel.textColor = UIColor.red
        _monthLabel.textAlignment = .center
        self.addSubview(_monthLabel)
        _monthLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(60)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        _leftButton.setTitle("<", for: .normal)
        _leftButton.setTitleColor(UIColor.red, for: .normal)
        _leftButton.rx.tap.subscribe(onNext: {
            self.leftButtonTapped()
        }).disposed(by: _disposeBag)
        self.addSubview(_leftButton)
        _leftButton.snp.makeConstraints { make in
            make.right.equalTo(_monthLabel.snp.left).offset(-15)
            make.height.equalTo(16)
            make.centerY.equalTo(_monthLabel.snp.centerY)
            make.width.equalTo(20)
        }
        
        _rightButton.setTitle(">", for: .normal)
        _rightButton.setTitleColor(UIColor.red, for: .normal)
        _rightButton.rx.tap.subscribe(onNext: {
            self.rightButtonTapped()
        }).disposed(by: _disposeBag)
        self.addSubview(_rightButton)
        _rightButton.snp.makeConstraints { make in
            make.left.equalTo(_monthLabel.snp.right).offset(15)
            make.height.equalTo(16)
            make.centerY.equalTo(_monthLabel.snp.centerY)
            make.width.equalTo(20)
        }
    }
    
    fileprivate func setupBottomButton() {
        
        _bottomButton.layer.cornerRadius = 5
        _bottomButton.layer.borderWidth = 1.0
        _bottomButton.layer.borderColor = UIColor.red.cgColor
        _bottomButton.setTitle("返回今天", for: .normal)
        _bottomButton.setTitleColor(UIColor.red, for: .normal)
        _bottomButton.rx.tap.subscribe(onNext: {
            self.backToToday()
        }).disposed(by: _disposeBag)
        self.addSubview(_bottomButton)
        _bottomButton.snp.makeConstraints { make in
            make.width.equalTo(175)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    fileprivate func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 7 - 3,
                                 height: UIScreen.main.bounds.width / 7 - 3)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 3
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        
        _collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        _collectionView?.alwaysBounceVertical = true
        _collectionView?.isScrollEnabled = true
        _collectionView?.delegate = self
        _collectionView?.dataSource = self
        _collectionView!.register(DateCalendarCell.self, forCellWithReuseIdentifier: _cellReuseIdentifier)
        _collectionView?.backgroundColor = UIColor.white
        self.addSubview(_collectionView!)
        _collectionView?.snp.makeConstraints({ make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(_bottomButton.snp.top)
            make.top.equalTo(_monthLabel.snp.bottom).offset(5)
        })
        
        _subTapGesture = UITapGestureRecognizer(target: self, action: #selector(doNothing))
        _collectionView?.addGestureRecognizer(_subTapGesture)
    }
    
    @objc func leftButtonTapped() {
        
        _selectMonth -= 1
        setupData()
        
        _collectionView?.reloadSections(IndexSet(integer: 1))
    }
    
    @objc func rightButtonTapped() {
        
        _selectMonth += 1
        setupData()
        
        _collectionView?.reloadSections(IndexSet(integer: 1))
    }
    
    @objc func backToToday() {
        
        self.cellTap?(self, _defaultSelectIndex)
        
        _collectionView?.selectItem(at: IndexPath(item: _defaultSelectIndex, section: 1),
                                    animated: true,
                                    scrollPosition: .top)
        if (_collectionView?.delegate?.responds(to: #selector(collectionView(_:didSelectItemAt:))))! {
            _collectionView?.delegate?.collectionView!(_collectionView!,
                                                       didSelectItemAt: IndexPath(item: _defaultSelectIndex,
                                                                                  section: 1))
        }
    }
    
    @objc func doNothing() {
        _subTapGesture.cancelsTouchesInView = false
    }

}

extension DateCalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in _collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return _weekArray.count
        } else {
            return _dateArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: _cellReuseIdentifier, for: indexPath) as! DateCalendarCell
        
        if indexPath.section == 0 {
            cell.labelText = _weekArray[indexPath.item]
            cell.labelColor = UIColor.lightGray
        } else {
            cell.labelText = _dateArray[indexPath.item].number
        }
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! DateCalendarCell
        
        if indexPath.section == 1 {
            
            if _dateArray[indexPath.item].number != "" {
                
                let item = _dateArray[indexPath.item]
                item.isSelect = !item.isSelect
                
                for i in 0..<_dateArray.count {
                    guard let temp = collectionView.cellForItem(at: IndexPath(item: i, section: 1)),
                        let cell = temp as? DateCalendarCell else
                    {
                        return
                    }
                    if _dateArray[i].number == "今天"
                        && _dateArray[i].number != _dateArray[indexPath.item].number
                    {
                        _dateArray[i].isSelect = false
                        cell.backgroundColor = UIColor.white
                        cell.labelColor = UIColor.black
                    }
                }
                
                if item.isSelect {
                    cell.backgroundColor = UIColor.red
                    cell.labelColor = UIColor.white
                } else {
                    cell.backgroundColor = UIColor.white
                    cell.labelColor = UIColor.black
                }
            }
            
            var index = indexPath.row
            for date in _dateArray {
                if date.number == "" {
                    index -= 1
                }
            }
            
            _currentSelectIndex = index
            cellTap?(self, _currentSelectIndex)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? DateCalendarCell else
        {
            return
        }
        
        if indexPath.section == 1 {
            let item = _dateArray[indexPath.item]
            
            if item.number == "今天" {
                _defaultSelectIndex = indexPath.item
            }
            
            if item.isSelect {
                cell.backgroundColor = UIColor.red
                cell.labelColor = UIColor.white
            } else {
                cell.backgroundColor = UIColor.white
                cell.labelColor = UIColor.black
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
         let cell = collectionView.cellForItem(at: indexPath) as! DateCalendarCell

        if indexPath.section == 1 {
            cell.backgroundColor = UIColor.white
            cell.labelColor = UIColor.black
        }
    }
    
}


