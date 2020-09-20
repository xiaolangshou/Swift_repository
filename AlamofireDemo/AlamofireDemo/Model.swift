//
//  Model.swift
//  AlamofireDemo
//
//  Created by Thomas Lau on 2020/9/20.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import Foundation

/**
 "message" : {
   "name" : "Bill Gates",
   "id" : 2234,
   "created_at" : "2020-02-11T07:00:41Z",
   "updated_at" : "2020-02-11T07:00:49Z",
   "message" : "I still don't feel threatened, Mr. Jobs.",
   "message_date" : "2019-11-15"
 }
 */

class TheModel: Codable {
    var name: String?
    var id: Int?
    var created_at: String?
    var updated_at: String?
    var message: String?
    var message_date: String?
}
