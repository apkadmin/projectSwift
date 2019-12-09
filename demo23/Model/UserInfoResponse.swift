//
//  Response.swift
//  demo23
//
//  Created by An Nguyen on 12/4/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//
import ObjectMapper
class UserInfoResponse: Mappable {
    var responseTime:String = ""
    var code: Int = -1
    var message:String = ""
    var data: DataUser!
    
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

class DataUser: Mappable {
    var userType = 0
    var userProfile: UserProfile?
    var token = ""

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        userType <- map["userType"]
        userProfile <- map["userProfile"]
        token <- map["token"]
    }
}

class UserProfile: Mappable {
    var id = ""
    var name = ""
    var phone = ""
    var password = ""
    var avatar = ""
    var role = 0
    var address = ""

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        phone <- map["phone"]
        password <- map["password"]
        avatar <- map["avatar"]
        role <- map["role"]
        address <- map["address"]
    }
}
