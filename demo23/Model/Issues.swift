//
//  Issues.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
//var id = 0
//var title = ""
//var content = ""
//var address = ""
//var time = ""
//var date = ""
//var status = ""
//var media = ""
//
//required convenience init?(map: Map) {
//    self.init()
//}
//
//func mapping(map: Map) {
//    id <- map["id"]
//    title <- map["title"]
//    content <- map["content"]
//    address <- map["address"]
//    time <- map["time"]
//    date <- map["date"]
//    status <- map["status"]
//    media <- map["media"]
//}


class Issue: Mappable {
    required convenience init?(map: Map) {
           self.init()
    }
    
    var content:String = ""
    var id:Int = -1
    var title = ""
    var address:String = ""
    var time :String = ""
    var date :String = ""
    var status :String = ""
    var media:[String] = []
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        content <- map["content"]
        address <- map["address"]
        time <- map["time"]
        date <- map["date"]
        status <- map["status"]
        media <- map["media"]
    }
}
class ResponseIssues: Mappable {
    var responseTime = ""
    var code = -1
    var message = ""
    var data: Issue?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        responseTime <- map["responseTime"]
        code <- map["code"]
        message <- map["message"]
        data <- map["data"]
    }
}
