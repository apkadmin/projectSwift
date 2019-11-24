//
//  RegisterScreen.swift
//  demo23
//
//  Created by An Nguyen on 11/23/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit
import SnapKit

class RegisterScreen: UIViewController {
    let containerView = UIView()
        let logoView = UIImageView(image: UIImage(named: "harder"))
        
        let feildPhone = UITextField()
        let feildPassword = UITextField()
        
        let actionLogin = UIButton()
        
        let phoneIcon = UIImageView(image: UIImage(named: "ic_phone"))
        let keyIcon = UIImageView(image: UIImage(named: "ic_key"))
    let rekeyIcon = UIImageView(image: UIImage(named: "ic_key"))
        let accountIcon = UIImageView(image: UIImage(named: "acount"))
        let userName = UITextField()
        let rePassword = UITextField()
        let notacount = UIView()
        let childnotacount = UILabel()
        let register = UIButton()
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            view.backgroundColor = UIColor.white
            containerView.backgroundColor = UIColor.white
            view.addSubview(containerView)
            containerView.addSubview(logoView)
            containerView.addSubview(userName)
            containerView.addSubview(feildPhone)
            containerView.addSubview(feildPassword)
            containerView.addSubview(rePassword)
            containerView.addSubview(actionLogin)
            
            containerView.addSubview(childnotacount)
            containerView.addSubview(register)
            containerView.snp.makeConstraints{(make) in
                make.leading.equalTo(view).inset(20)
                make.top.equalTo(view).inset(60)
                make.bottom.equalTo(view).inset(20)
                make.trailing.equalTo(view).inset(20)
            }

            logoView.snp.makeConstraints{(make) in
                make.centerX.equalTo(view)
                make.width.equalTo(130)
                make.height.equalTo(130)
                make.top.equalTo(containerView).offset(60)
            }
            
            phoneIcon.frame = CGRect(x: 0.0, y: 0.0,width:10,height: 10)
            accountIcon.frame = CGRect(x: 0.0, y: 0.0, width: 10, height: 10)
            userName.textAlignment = NSTextAlignment.center
            userName.leftView = accountIcon
            userName.placeholder = "Họ và tên"
            userName.leftViewMode = .always
            userName.snp.makeConstraints{(make) in
                make.top.equalTo(logoView.snp.bottom).offset(70)
                make.leading.equalTo(containerView.snp.leading).offset(20)
                make.trailing.equalTo(containerView.snp.trailing).offset(-20)
                make.height.equalTo(40)
            }
            
            feildPhone.placeholder = "Nhập số điện thoại"
            feildPhone.textAlignment = NSTextAlignment.center
            feildPhone.leftView = phoneIcon
            feildPhone.leftViewMode = .always
            feildPhone.snp.makeConstraints{(make) in
                make.top.equalTo(userName.snp.bottom).offset(20)
                make.leading.equalTo(containerView.snp.leading).offset(20)
                make.trailing.equalTo(containerView.snp.trailing).offset(-20)
                make.height.equalTo(40)
            }
            
            keyIcon.frame = CGRect(x: 0.0, y: 0.0,width:10,height: 10)
            
            feildPassword.placeholder = "Mật khẩu"
            feildPassword.textAlignment = NSTextAlignment.center
            feildPassword.leftView = keyIcon
            feildPassword.leftViewMode = .always
            feildPassword.borderStyle = .none
            feildPassword.snp.makeConstraints{(make) in
                make.top.equalTo(feildPhone.snp.bottom).offset(20)
                make.leading.equalTo(containerView.snp.leading).offset(20)
                make.trailing.equalTo(containerView.snp.trailing).offset(-20)
                make.height.equalTo(40)
            }
            
            rePassword.placeholder = "Nhập lại mật khẩu"
            rePassword.textAlignment = NSTextAlignment.center
            rePassword.leftView = rekeyIcon
            rePassword.leftViewMode = .always
            rePassword.borderStyle = .none
            rePassword.snp.makeConstraints{(make) in
                make.top.equalTo(feildPassword.snp.bottom).offset(20)
                make.leading.equalTo(containerView.snp.leading).offset(20)
                make.trailing.equalTo(containerView.snp.trailing).offset(-20)
                make.height.equalTo(40)
            }
            
            actionLogin.layer.cornerRadius = 5
         
            actionLogin.setTitle("Đăng ký", for: .normal)
            actionLogin.backgroundColor = UIColor.orange
            actionLogin.snp.makeConstraints{(make) in
                make.top.equalTo(rePassword.snp.bottom).offset(40)
                make.leading.equalTo(containerView.snp.leading).offset(20)
                make.trailing.equalTo(containerView.snp.trailing).offset(-20)
                make.height.equalTo(50)
            }
            
            childnotacount.text = "Đã có tài khoản?"
            register.setTitle("Đăng nhập", for: .normal)
            register.setTitleColor(UIColor.orange, for: .normal)
            register.addTarget(self, action: #selector(Login), for: .touchUpInside)
           
            
           register.snp.makeConstraints{ (make) in
                make.trailing.equalTo(actionLogin.snp.trailing).offset(-20)
                make.top.equalTo(actionLogin.snp.bottom).offset(30)
            }
            
            childnotacount.snp.makeConstraints{ (make) in
                     make.top.equalTo(actionLogin.snp.bottom).offset(30)
                   make.leading.equalTo(actionLogin.snp.leading).offset(20)
               }
    }
    
    @objc func Login(){
        dismiss(animated: true, completion: nil)
               }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(true)
            
            feildPhone.underline(UIColor.gray)
            feildPassword.underline(UIColor.gray)
            rePassword.underline(UIColor.gray)
            userName.underline(UIColor.gray)
            
        }
}
