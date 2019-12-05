//
//  testmodel.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//
//
//import Foundation
//class Iterm : Codable {
//    var collectionExplicitness: String
//    var releaseDate: String
//    var currency: String
//    var artistId: Double?
//    var previewUrl: String
//    var trackPrice: Float?
//    var isStreamable: Bool?
//    var description: String?
//}
//
//class ResultIterm: Codable {
//var resultCount: Int = 0
//    var results = [Iterm]()
//    static func parseData(_ data: Data) -> [Iterm] {
//        do {
//            let decoder = JSONDecoder()
//            let resultObject = try decoder.decode(ResultIterm.self, from: data)
//            return resultObject.results
//        } catch {
//            print("JSON Error: \(error)")
//            return []
//        }
//    }
//}
