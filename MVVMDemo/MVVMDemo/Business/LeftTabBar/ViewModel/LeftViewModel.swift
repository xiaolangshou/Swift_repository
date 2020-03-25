//
//  LeftViewModel.swift
//  MVVMDemo
//
//  Created by mac on 2018/12/1.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LeftViewModel {
    
    var aliData = BehaviorRelay<AliView.ShowData>(value: AliView.ShowData())
    
    init(cityName: String?) {
        
        requestData(city: cityName ?? "")
    }
    
    func requestData(city: String) {
        
        let req = theAPI.getAliInfo(cityName: city).map { result -> AliView.ShowData in
            let resultValue = result.value
            let data = AliView.ShowData()
            data.address = resultValue?.address ?? ""
            data.alevel = resultValue?.alevel ?? 0
            data.cityName = resultValue?.cityName ?? ""
            data.lon = resultValue?.lon ?? 0
            data.lat = resultValue?.lat ?? 0
            data.level = resultValue?.level ?? 0
            
            return data
            }.share(replay: 1, scope: .forever)
        
        _ = req.asDriver(onErrorJustReturn: AliView.ShowData()).drive(aliData)
    }
}
