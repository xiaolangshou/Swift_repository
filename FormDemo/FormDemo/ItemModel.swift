//
//  ItemModel.swift
//  FormDemo
//
//  Created by Liu Tao on 2018/12/19.
//  Copyright © 2018年 TLLTD. All rights reserved.
//

import Foundation

class ItemModel {
    
    var rows: Int?
    var colums: Int?
    
    init(rows: Int, colums: Int) {
        
        self.rows = rows
        self.colums = colums
    }
    
    init() {
        self.rows = 0
        self.colums = 0
    }
}
