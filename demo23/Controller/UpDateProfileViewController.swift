//
//  UpDateProfileViewController.swift
//  demo23
//
//  Created by An Nguyen on 12/4/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class UpDateProfileViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    let userImageView : UIImageView = {
        let image = UIImageView()
            image.contentMode = .scaleAspectFill
            image.layer.cornerRadius = 75
            image.layer.masksToBounds = true
            image.image = UIImage(named: "user")
        return image
    }()
    let changeImageLabel : UILabel = {
        let label = UILabel()
            label.text = "Đổi ảnh đại diện"
        return label
    }()
    let usernameTextFieldAnimated : UITextFieldAnimated = {
        let text = UITextFieldAnimated()
            text.Label.text = "Họ và tên"
            text.Input.setBottomBorder()
            text.Input.text = "Han Duy"
        return text
    }()
    let phoneTextFieldAnimated : UITextFieldAnimated = {
        let text = UITextFieldAnimated()
            text.Label.text = "Số điện thoại"
            text.Input.setBottomBorder()
            text.Input.text = "0123456789"
        return text
    }()
    let addressTextFieldAnimated : UITextFieldAnimated = {
        let text = UITextFieldAnimated()
            text.Label.text = "Địa chỉ"
            text.Input.setBottomBorder()
            text.Input.text = "Ha Noi"
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setView()
        // Do any additional setup after loading the view.
    }
    
    //set navigation
    func setNavigation(){
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu") ,style: .done, target: self, action: #selector(showMenu))
        navigationItem.title = "Hồ sơ"
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .init(red: 255/255, green: 127/255, blue: 69/255, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.white
  
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cập nhật",
        style:UIBarButtonItemStyle.plain,
        target:self,
        action:#selector(saveInfo))//        navigationController?.navigationBar.isTranslucent = true
//             self.automaticallyAdjustsScrollViewInsets = true
        self.edgesForExtendedLayout = UIRectEdge.top
        self.edgesForExtendedLayout = UIRectEdge.bottom
    }
    
    func setView(){
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(userImageView)
        containerView.addSubview(changeImageLabel)
        containerView.addSubview(usernameTextFieldAnimated)
        containerView.addSubview(phoneTextFieldAnimated)
        containerView.addSubview(addressTextFieldAnimated)
       

        scrollView.snp.makeConstraints{(make) in
            make.top.leading.trailing.bottom.equalTo(view).inset(0)
        }
        
        containerView.snp.makeConstraints{(make) in
            make.leading.trailing.top.bottom.equalTo(scrollView)
            make.width.equalTo(view).multipliedBy(1)
            make.height.equalTo(600)
        }
        if let useravatar = UserDefaults.standard.string(forKey: "useravatar"), !useravatar.isEmpty {
            userImageView.image = UIImage(named: useravatar)
        }
        userImageView.snp.makeConstraints{(make) in
            make.centerX.equalTo(containerView)
            make.top.equalTo(containerView).inset(20)
            make.height.width.equalTo(150)
        }
        
        changeImageLabel.snp.makeConstraints{(make) in
            make.top.equalTo(userImageView.snp.bottom).offset(20)
            make.centerX.equalTo(userImageView)
        }

        if let username = UserDefaults.standard.string(forKey: "username"), !username.isEmpty {
            usernameTextFieldAnimated.Input.text = username
        }
        
        if usernameTextFieldAnimated.Input.text != "" {
            usernameTextFieldAnimated.textFieldDidBeginEditing(usernameTextFieldAnimated.Input)
        }
        usernameTextFieldAnimated.snp.makeConstraints{(make) in
            make.leading.trailing.equalTo(containerView).inset(50)
            make.top.equalTo(changeImageLabel).offset(50)
            make.height.equalTo(50)
        }
        
        if let userphone = UserDefaults.standard.string(forKey: "userphone"), !userphone.isEmpty {
               phoneTextFieldAnimated.Input.text = userphone
           }
        if phoneTextFieldAnimated.Input.text != "" {
            phoneTextFieldAnimated.textFieldDidBeginEditing(phoneTextFieldAnimated.Input)
        }
        phoneTextFieldAnimated.snp.makeConstraints{(make) in
            make.leading.trailing.equalTo(containerView).inset(50)
            make.top.equalTo(usernameTextFieldAnimated.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        if let useraddress = UserDefaults.standard.string(forKey: "useraddress"), !useraddress.isEmpty {
            phoneTextFieldAnimated.Input.text = useraddress
        }
        if addressTextFieldAnimated.Input.text != "" {
            addressTextFieldAnimated.textFieldDidBeginEditing(addressTextFieldAnimated.Input)
        }
        addressTextFieldAnimated.snp.makeConstraints{(make) in
            make.leading.trailing.equalTo(containerView).inset(50)
            make.top.equalTo(phoneTextFieldAnimated.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
    }
    
    //set Acction
       //action show menu navbar
       @objc func showMenu(){
           self.slideMenuController()?.openLeft()
       }
    
    @objc func saveInfo(){
        print("save")
    }
   

}
