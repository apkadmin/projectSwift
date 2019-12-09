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
    public static var updateProfileURI : String = "\(baseURI)/update-profile"
    public static var getIssuesURI : String = "\(baseURI)/issues"
    public static var uploadFileURI : String = "\(baseURI)/upload-file"
    public static var createIssues : String = "\(baseURI)/create-issue"
    
    public static func login(_ phone:String, _ password: String, success: @escaping (_ user: DataUser )->(), error: @escaping (_ error : String)->()){
        let params = [
            "phone": phone,
            "password": password
        ]
        Alamofire.request(ApiGateWay.loginURI, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<UserInfoResponse>) in
            let profileResponse = response.value
            if profileResponse?.code == 0 {
                if let res = profileResponse?.data {
                   UserDefaults.standard.set(res.token, forKey: TOKEN)
                   UserDefaults.standard.set(res.userProfile?.avatar, forKey: USERIMAGE)
                   UserDefaults.standard.set(res.userProfile?.name, forKey: USERNAME)
                   UserDefaults.standard.set(res.userProfile?.phone, forKey: USERPHONE)
                   UserDefaults.standard.set(res.userProfile?.address, forKey: USERADDR)
                    success(res)
                    Switcher.updateRootVC()
                }
            } else{
                if let message = profileResponse?.message {
                    error(message)
                } else {
                    error("Không xác định")
                }
            }
        }
    }
    
    public static func register(_ name: String, _ phone: String, _ password: String, success: @escaping (_ user: DataUser)->(), error: @escaping (_ error: String)->()){
        let parameters = [
                   "name": name,
                   "phone": phone,
                   "password": password
               ]
        Alamofire.request(ApiGateWay.registerURI,method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<UserInfoResponse>) in
               let profileResponse = response.value
               if profileResponse?.code == 0 {
                   if let res = profileResponse?.data {
                        UserDefaults.standard.set(res.token, forKey: TOKEN)
                        UserDefaults.standard.set(res.userProfile?.avatar, forKey: USERIMAGE)
                        UserDefaults.standard.set(res.userProfile?.name, forKey: USERNAME)
                        UserDefaults.standard.set(res.userProfile?.phone, forKey: USERPHONE)
                        UserDefaults.standard.set(res.userProfile?.address, forKey: USERADDR)
                        success(res)
                        Switcher.updateRootVC()
                   }
               } else{
                   if let message = profileResponse?.message {
                       error(message)
                   } else {
                       error("Không xác định")
                   }
               }
           }
    }
    
    public static func getIssues(_ status: Int = 0, keyword: String = "", success: @escaping (_ data: [Issue])->(), error: @escaping (_ error: String)-> ()){
        if let token = UserDefaults.standard.string(forKey: TOKEN), token != "" {
        let setHeader = [
            "Authorization": token
        ]
        Alamofire.request("\(ApiGateWay.getIssuesURI)?status=-1&keyword=", method: .get,encoding: JSONEncoding.default, headers: (setHeader as! HTTPHeaders))
        .responseObject { (response: DataResponse<DataIsuesResponse>) in
              let profileResponse = response.value
              if profileResponse?.code == 0 {
                  if let res = profileResponse?.data {
                    if res.resultCount != 0 {
                        success(res.result)
                    } else {
                        error("Chưa có dữ liệu")
                    }
                  }
              } else {
                error("Lỗi chưa xác định")
            }
          }
        }
    }
    public static func getIssueDetail(_ id: Int, success: @escaping (_ data: Issue) -> (), error: @escaping (_ error: String)->()){
        if let token = UserDefaults.standard.string(forKey: TOKEN), token != "" {
            let setHeader = [
                "Authorization": token
            ]
            Alamofire.request("\(ApiGateWay.getIssuesURI)/\(id)", method: .get,encoding: JSONEncoding.default, headers: (setHeader as! HTTPHeaders))
                .responseObject { (response: DataResponse<ResponseIssue>) in
                    let profileResponse = response.value
                    if profileResponse?.code == 0 {
                    if let res = profileResponse?.data {
                        success(res)
                    } else {
                        error("Mã lỗi không tồn tại")
                    }
                    } else {
                        error("Lỗi chưa xác định")
                    }
                }
        }
    }
    
    public static func createIssues(_ title: String, _ content: String, _ address: String,_ media: [String],success: @escaping (_ data: Issue)->(), error: @escaping (_ error: String)->()){
        let status = UserDefaults.standard.string(forKey: TOKEN)
        let setHeader = [
            "Authorization": status
        ]
        let parameters: [String : Any] = [
            "title": title,
            "content": content,
            "address": address,
            "status": "Chưa xử lý",
            "media": media
            ]
        Alamofire.request(ApiGateWay.createIssues,method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: (setHeader as! HTTPHeaders)).responseObject { (response: DataResponse<ResponseIssues>) in
                 let profileResponse = response.value
                 if profileResponse?.code == 0 {
                     if let res = profileResponse?.data {
                        success(res)
                     }
                 } else {
                    error(profileResponse!.message)
                }
             }
    }
    
}
