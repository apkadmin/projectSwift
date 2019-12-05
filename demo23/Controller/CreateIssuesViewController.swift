//
//  CreateIssuesViewController.swift
//  demo23
//
//  Created by An Nguyen on 12/4/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class CreateIssuesViewController: UIViewController {

    let scrollView = UIScrollView()
    let containerView = UIView()
    let addressTextFieldAnimated = UITextFieldAnimated()
    let titleTextFieldAnimated = UITextFieldAnimated()
    let descriptionLabel = UILabel()
    let descriptionTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setView()
        // Do any additional setup after loading the view.
    }
    
    func setNavigation(){
            navigationController?.navigationBar.isHidden = false
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu") ,style: .done, target: self, action: #selector(showMenu))
            navigationItem.title = "Báo cáo sự cố"
            navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController?.navigationBar.barTintColor = .init(red: 255/255, green: 127/255, blue: 69/255, alpha: 1.0)
            navigationController?.navigationBar.tintColor = UIColor.white
      
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Gửi",
            style:UIBarButtonItemStyle.plain,
            target:self,
            action:#selector(sendIssues))//        navigationController?.navigationBar.isTranslucent = true
    //             self.automaticallyAdjustsScrollViewInsets = true
            self.edgesForExtendedLayout = UIRectEdge.top
            self.edgesForExtendedLayout = UIRectEdge.bottom
        }
        
    func setView(){
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(addressTextFieldAnimated)
        containerView.addSubview(titleTextFieldAnimated)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(descriptionTextView)
        
        scrollView.snp.makeConstraints{(make) in
            make.top.left.right.bottom.equalTo(view)
        }
        containerView.snp.makeConstraints{(make) in
            make.left.right.top.bottom.equalTo(scrollView)
            make.width.equalTo(view).multipliedBy(1)
            make.height.equalTo(800)
        }
        addressTextFieldAnimated.Label.text = "Địa chỉ xảy ra vấn đề"
        addressTextFieldAnimated.Input.setBottomBorder()
        addressTextFieldAnimated.snp.makeConstraints{(make) in
            make.left.right.equalTo(containerView).inset(20)
            make.top.equalTo(containerView).inset(60)
        }
        titleTextFieldAnimated.Label.text = "Tiêu đề"
        titleTextFieldAnimated.Input.setBottomBorder()
        titleTextFieldAnimated.snp.makeConstraints{(make) in
            make.left.right.equalTo(addressTextFieldAnimated)
            make.top.equalTo(addressTextFieldAnimated.snp.bottom).offset(60)
        }
        descriptionLabel.text = "Nội dung"
        descriptionLabel.snp.makeConstraints{(make) in
            make.top.equalTo(titleTextFieldAnimated.snp.bottom).offset(60)
            make.left.right.equalTo(titleTextFieldAnimated)
        }
        descriptionTextView.layer.borderWidth = 0.5
        let myColor : UIColor = UIColor( red: 0.5, green: 0.5, blue:0, alpha: 1.0 )
        descriptionTextView.layer.borderColor = myColor.cgColor

        descriptionTextView.font = UIFont.systemFont(ofSize: 20)
        descriptionTextView.snp.makeConstraints{(make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.left.right.equalTo(titleTextFieldAnimated)
            make.height.equalTo(100).priority(99)
        }
    }
    
    
       //action show menu navbar
    @objc func showMenu(){
           self.slideMenuController()?.openLeft()
       }
    
    @objc func sendIssues(){
        print("save")
    }

}
