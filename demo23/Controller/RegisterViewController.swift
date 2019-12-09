//
//  RegisterScreen.swift
//  demo23
//
//  Created by An Nguyen on 11/23/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class RegisterViewController: UIViewController {
    let scrollView     = TPKeyboardAvoidingScrollView()
    let containerView  = UIView()
    let notAcountView     = UIView()
    let logoImageView   = UIImageView(image: UIImage(named: "harder"))
    let phoneIcon      = UIImageView(image: UIImage(named: "ic_phone"))
    let keyIcon        = UIImageView(image: UIImage(named: "ic_key"))
    let rekeyIcon      = UIImageView(image: UIImage(named: "ic_key"))
    let accountIcon    = UIImageView(image: UIImage(named: "acount"))
    let errorLabel: UILabel       = {
        let label = UILabel()
        label.textColor = .red
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let userNameField : UITextField = {
        let textField = UITextField()
            textField.textAlignment = NSTextAlignment.center
            textField.placeholder   = "Họ và tên"
            textField.leftViewMode  = .always
            textField.setBottomBorder()
        return textField
    }()
    
    let phoneField : UITextField = {
        let textField = UITextField()
            textField.placeholder   = "Nhập số điện thoại"
            textField.textAlignment = NSTextAlignment.center
            textField.leftViewMode  = .always
            textField.setBottomBorder()
        return textField
    }()
    
    let passwordField : UITextField = {
        let textField = UITextField()
            textField.placeholder   = "Mật khẩu"
            textField.textAlignment = NSTextAlignment.center
            textField.leftViewMode  = .always
            textField.borderStyle   = .none
            textField.isSecureTextEntry = true
            textField.setBottomBorder()
        return textField
    }()
    let repasswordField : UITextField = {
        let textField = UITextField()
            textField.placeholder   = "Nhập lại mật khẩu"
            textField.textAlignment = NSTextAlignment.center
            textField.leftViewMode  = .always
            textField.borderStyle   = .none
            textField.isSecureTextEntry = true
            textField.setBottomBorder()
        return textField
    }()
    let registerButton    : UIButton = {
        let btn = UIButton()
            btn.layer.cornerRadius = 5
            btn.setTitle("Đăng ký", for: .normal)
            btn.backgroundColor = UIColor.orange
            btn.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
        return btn
    }()
    let childNoAcountLabel : UILabel = {
           let textLabel = UILabel()
               textLabel.text = "Đã có tài khoản?"
           return textLabel
    }()
    let loginButton       : UIButton = {
        let btn = UIButton()
            btn.setTitle("Đăng nhập", for: .normal)
            btn.setTitleColor(UIColor.orange, for: .normal)
            btn.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
        return btn
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView(){
        self.navigationController?.isNavigationBarHidden = true            // Do any additional
        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(logoImageView)
        containerView.addSubview(userNameField)
        containerView.addSubview(phoneField)
        containerView.addSubview(passwordField)
        containerView.addSubview(repasswordField)
        containerView.addSubview(registerButton)
        containerView.addSubview(childNoAcountLabel)
        containerView.addSubview(loginButton)
        containerView.addSubview(errorLabel)
        
        scrollView.snp.makeConstraints{(make) in
            make.top.bottom.left.right.equalTo(view)
        }
        
        containerView.snp.makeConstraints{(make) in
           make.left.right.equalTo(view).inset(20)
           make.top.equalTo(scrollView).inset(0)
           make.height.equalTo(700)
        }

        logoImageView.snp.makeConstraints{(make) in
           make.centerX.equalTo(containerView)
           make.width.height.equalTo(130)
           make.top.equalTo(containerView).offset(60)
        }
        errorLabel.snp.makeConstraints{(make) in
            make.left.right.equalTo(containerView).inset(30)
            make.top.equalTo(logoImageView.snp.bottom).offset(50)
        }
        userNameField.leftView = accountIcon
        userNameField.snp.makeConstraints{(make) in
            make.top.equalTo(errorLabel.snp.bottom).offset(20)
            make.left.right.equalTo(containerView).inset(20)
            make.height.equalTo(40)
        }
        
        phoneField.leftView = phoneIcon
        phoneField.snp.makeConstraints{(make) in
            make.top.equalTo(userNameField.snp.bottom).offset(20)
            make.left.right.height.equalTo(userNameField)
        }

        passwordField.leftView = keyIcon
        passwordField.snp.makeConstraints{(make) in
           make.top.equalTo(phoneField.snp.bottom).offset(20)
           make.left.right.height.equalTo(userNameField)
        }
        
        repasswordField.leftView = rekeyIcon
        repasswordField.snp.makeConstraints{(make) in
           make.top.equalTo(passwordField.snp.bottom).offset(20)
           make.left.right.height.equalTo(userNameField)
        }


        registerButton.snp.makeConstraints{(make) in
            make.top.equalTo(repasswordField.snp.bottom).offset(40)
            make.left.right.height.equalTo(userNameField)
        }


        loginButton.snp.makeConstraints{ (make) in
           make.right.equalTo(registerButton.snp.right).offset(-20)
           make.top.equalTo(registerButton.snp.bottom).offset(30)
        }

        childNoAcountLabel.snp.makeConstraints{ (make) in
              make.top.equalTo(registerButton.snp.bottom).offset(30)
              make.left.equalTo(registerButton.snp.left).offset(20)
          }
        
    }
    
    @objc func onLogin(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func onRegister(){
        self.errorLabel.text = ""
        if let username = userNameField.text, !username.isEmpty, let phone = phoneField.text, !phone.isEmpty,let repasswd = repasswordField.text, !repasswd.isEmpty, let passwd = passwordField.text, !passwd.isEmpty {
            if passwd == repasswd {
                ApiGateWay.register(username, phone, passwd, success: {(data) in
                    print(data)
                }, error: {(error) in
                    self.errorLabel.text = error
                })
            } else {
                self.errorLabel.text = "Nhập lại password không đúng"
            }
        } else {
            self.errorLabel.text = "Mọi trường cần phải đầy đủ"
        }
    }
    
    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
