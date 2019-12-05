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
        return image
    }()
    let changeImageLabel : UILabel = {
        let label = UILabel()
            label.text = "Đổi ảnh đại diện"
        return label
    }()
    let usernameTextFieldAnimated = UITextFieldAnimated()
    let phoneTextFieldAnimated = UITextFieldAnimated()
    let addressTextFieldAnimated = UITextFieldAnimated()

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
        
        userImageView.image = UIImage(named: "user")
        userImageView.snp.makeConstraints{(make) in
            make.centerX.equalTo(containerView)
            make.top.equalTo(containerView).inset(20)
            make.height.width.equalTo(150)
        }
        
        changeImageLabel.snp.makeConstraints{(make) in
            make.top.equalTo(userImageView.snp.bottom).offset(20)
            make.centerX.equalTo(userImageView)
        }
        usernameTextFieldAnimated.Label.text = "Họ và tên"
        usernameTextFieldAnimated.Input.setBottomBorder()
        usernameTextFieldAnimated.Input.text = "Han Duy"
        if usernameTextFieldAnimated.Input.text != "" {
            usernameTextFieldAnimated.textFieldDidBeginEditing(usernameTextFieldAnimated.Input)
        }
        usernameTextFieldAnimated.snp.makeConstraints{(make) in
            make.leading.trailing.equalTo(containerView).inset(50)
            make.top.equalTo(changeImageLabel).offset(50)
            make.height.equalTo(50)
        }
        phoneTextFieldAnimated.Label.text = "Số điện thoại"
        phoneTextFieldAnimated.Input.setBottomBorder()
        phoneTextFieldAnimated.Input.text = "0123456789"
        if phoneTextFieldAnimated.Input.text != "" {
            phoneTextFieldAnimated.textFieldDidBeginEditing(phoneTextFieldAnimated.Input)
        }
        phoneTextFieldAnimated.snp.makeConstraints{(make) in
            make.leading.trailing.equalTo(containerView).inset(50)
            make.top.equalTo(usernameTextFieldAnimated.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        addressTextFieldAnimated.Label.text = "Địa chỉ"
        addressTextFieldAnimated.Input.setBottomBorder()
        addressTextFieldAnimated.Input.text = "Ha noi"
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
