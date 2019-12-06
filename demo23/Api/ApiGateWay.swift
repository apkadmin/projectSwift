//
//  ApiGateWay.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import Foundation
class ApiGateWay {
    public static var baseURI : String     = "http://45.118.145.149:8100"
    public static var loginURI : String    = "\(baseURI)/login"
    public static var registerURI : String = "\(baseURI)/register"
//        let url = "http://www.json-generator.com/api/json/get/cpdTnDkCnC?indent=2"
    //        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{[weak self] (response) in
    //            print("response: \(response.result)")
    //            guard let data = response.data, let strongSelf = self else {return}
    //            strongSelf.iterm = ResultIterm.parseData(data)
    //            strongSelf.menu.reloadData()
    //        }
    //        Alamofire.request(url,method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseOb
}
