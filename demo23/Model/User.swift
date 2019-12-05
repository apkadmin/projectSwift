//
//  User.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

//import Foundation
//
//class User: Codable {
//    var id: String
//    var name: String
//    var about: String
//    init(id: String, name: String, about: String){
//        self.id = id
//        self.name = name
//        self.about = about
//    }
//}
//
//class ResultObject: Codable {
//    var resultCount: Int = 0
//    var results = [User]()
//    static func parseData(_ data: Data) -> [User] {
//        do {
//            let decoder = JSONDecoder()
//            let resultObject = try decoder.decode(ResultObject.self, from: data)
//            return resultObject.results
//        } catch {
//            print("JSON Error: \(error)")
//            return []
//        }
//    }
//}
