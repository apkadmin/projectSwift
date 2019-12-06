//
//  ViewController.swift
//  demo23
//
//  Created by An Nguyen on 11/23/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
class LoginViewController: UIViewController {
    let scrollView    = TPKeyboardAvoidingScrollView()
    let containerView = UIView()
    let logoView      = UIImageView(image: UIImage(named: "harder"))
    let phoneIcon     = UIImageView(image: UIImage(named: "ic_phone"))
    let keyIcon       = UIImageView(image: UIImage(named: "ic_key"))
    let feildPhone : UITextField = {
        let inputField = UITextField()
            inputField.placeholder   = "Nhập số điện thoại"
            inputField.textAlignment = NSTextAlignment.center
            inputField.leftViewMode  = .always
            inputField.setBottomBorder()
        return inputField
    }()
    let feildPassword : UITextField = {
        let inputField = UITextField()
            inputField.placeholder   = "Mật khẩu"
            inputField.textAlignment = NSTextAlignment.center
            inputField.leftViewMode  = .always
            inputField.borderStyle   = .none
            inputField.isSecureTextEntry = true
            inputField.setBottomBorder()
        return inputField
    }()
    let btnLogin : UIButton = {
        let btn = UIButton()
            btn.layer.cornerRadius = 5
            btn.backgroundColor    = UIColor.orange
            btn.setTitle("Đăng nhập", for: .normal)
            btn.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
        return btn
    }()
    let childnotacount : UILabel = {
        let textLabel = UILabel()
            textLabel.text = "Chưa có tài khoản?"
        return textLabel
    }()
    let register : UIButton = {
        let btn = UIButton()
            btn.setTitle("Đăng ký", for: .normal)
            btn.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
            btn.setTitleColor(UIColor.orange, for: .normal)
        return btn
    }()
    let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    
    func setView(){
        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(logoView)
        containerView.addSubview(errorLabel)
        containerView.addSubview(feildPhone)
        containerView.addSubview(feildPassword)
        containerView.addSubview(btnLogin)
        containerView.addSubview(childnotacount)
        containerView.addSubview(register)
        
        view.backgroundColor = .white
        scrollView.snp.makeConstraints{(make) in
            make.top.bottom.left.right.equalTo(view)
        }
        
        containerView.snp.makeConstraints{(make) in
            make.left.right.equalTo(view).inset(20)
            make.top.equalTo(scrollView).inset(0)
            make.height.equalTo(600)
        }

        logoView.snp.makeConstraints{(make) in
            make.centerX.equalTo(containerView)
            make.top.equalTo(containerView).offset(60)
            make.width.height.equalTo(150)
        }
        errorLabel.snp.makeConstraints{(make) in
            make.left.right.equalTo(containerView).inset(30)
            make.top.equalTo(logoView.snp.bottom).offset(60)
        }
        feildPhone.leftView = phoneIcon
        feildPhone.snp.makeConstraints{(make) in
            make.top.equalTo(errorLabel.snp.bottom).offset(20)
            make.left.right.equalTo(containerView).inset(20)
            make.height.equalTo(40)
        }

        feildPassword.leftView = keyIcon
        feildPassword.snp.makeConstraints{(make) in
            make.top.equalTo(feildPhone.snp.bottom).offset(40)
            make.left.right.height.equalTo(feildPhone)
        }
        
        btnLogin.snp.makeConstraints{(make) in
            make.top.equalTo(feildPassword.snp.bottom).offset(40)
            make.left.right.height.equalTo(feildPhone)
        }
        
        register.snp.makeConstraints{ (make) in
            make.right.equalTo(btnLogin).offset(-20)
            make.top.equalTo(btnLogin.snp.bottom).offset(30)
        }
        
        childnotacount.snp.makeConstraints{ (make) in
            make.left.equalTo(btnLogin).offset(20)
            make.top.equalTo(btnLogin.snp.bottom).offset(30)
        }
    }
    

    @objc func onRegister(){
        let mainVC = RegisterViewController()
        let navigation = UINavigationController(rootViewController: mainVC)
        present(navigation, animated: true, completion: nil)
    }
    
    @objc func onLogin(){
        let params = [
            "phone": feildPhone.text,
            "password": feildPassword.text
        ]
        Alamofire.request(ApiGateWay.loginURI, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<UserInfoResponse>) in
            let profileResponse = response.value
            if profileResponse?.code == 0 {
                if let res = profileResponse?.data {
                    UserDefaults.standard.set(res.token, forKey: "status")
                    UserDefaults.standard.set(res.userProfile?.avatar, forKey: "useravatar")
                    UserDefaults.standard.set(res.userProfile?.name, forKey: "username")
                    UserDefaults.standard.set(res.userProfile?.phone, forKey: "userphone")
                    UserDefaults.standard.set(res.userProfile?.address, forKey: "useraddress")
                    Switcher.updateRootVC()
                }
            } else{
                if let message = profileResponse?.message {
                    self.errorLabel.text = message
                } else {
                    self.errorLabel.text = "Không xác định"
                }
            }
        }
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let switchViewController = storyBoard.instantiateViewController(withIdentifier: "SettingScreen") as! SettingViewController
//
//        self.present(switchViewController, animated:false, completion:nil)
        
        
//        UserDefaults.standard.set(true, forKey: "status")
//        Switcher.updateRootVC()
        
        
//        let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as! ViewController
//        let appDelegate = UIApplication.shared.delegate
//        appDelegate?.window??.rootViewController = signInPage
    }


}


