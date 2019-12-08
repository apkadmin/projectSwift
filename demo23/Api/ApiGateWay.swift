//
//  ApiGateWay.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class ApiGateWay {
    public static var baseURI : String     = "http://45.118.145.149:8100"
    public static var loginURI : String    = "\(baseURI)/login"
    public static var registerURI : String = "\(baseURI)/register"
    public static var getIssuesURI : String = "\(baseURI)/issues"
    public static var uploadFileURI : String = "\(baseURI)/upload-file"
    public static var createIssues : String = "\(baseURI)/create-issue"
}
