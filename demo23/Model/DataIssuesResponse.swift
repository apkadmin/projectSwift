//
//  DataIssues.swift
//  demo23
//
//  Created by An Nguyen on 12/6/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
class DataIssues: Mappable {
    var result = [Issue]()
    var resultCount = 0

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        result <- map["result"]
        resultCount <- map["resultCount"]
    }
}
class ResponseIssue: Mappable {
    var responseTime = ""
    var code = -1
    var message = ""
    var data: Issue!

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
class DataIsuesResponse: Mappable {
    var responseTime:String = ""
    var code: Int = -1
    var message:String = ""
    var data: DataIssues?

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
