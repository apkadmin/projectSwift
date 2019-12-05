//
//  Issues.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import Foundation
class Issue {
    var id: Int
    var status: String
    var address: String
    var title: String
    var description: String
    var images : [String]
    var date:String
    var time:String
    
    init(id:Int,status:String,address:String,title:String,description:String,date:String, time: String,images:[String]) {
        self.id          = id
        self.status      = status
        self.address     = address
        self.title       = title
        self.description = description
        self.images      = images
        self.date        = date
        self.time        = time
    }
}
