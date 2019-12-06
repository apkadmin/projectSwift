//
//  MenuViewController.swift
//  demo23
//
//  Created by An Nguyen on 12/1/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
      var delegate: HomeControllerDelegate?
    var listMenu:[Menu] = [Menu]()
    let containner = UIView()
    let cardInfo = UIView()
    let cardUser:UIView = {
        let view = UIView()
            view.layer.borderWidth = 0.2
        return view
     }()
    let cardImage:UIImageView = {
        let view = UIImageView(image:#imageLiteral(resourceName: "user"))
            view.frame(forAlignmentRect: CGRect(x:0,y:0,width: 60,height: 60))
            view.layer.masksToBounds = true
        return view
    }()
    let userName:UILabel = {
        let view = UILabel()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.text = "Han Duy"
            view.font = UIFont.systemFont(ofSize: 26)
        return view
    }()
    let userPhone:UILabel = {
        let view = UILabel()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.text = "0123456789"
            view.textColor = UIColor.gray
        return view
    }()
    let menu : UITableView = {
        let view = UITableView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setListController()
    }
    
    // init view
    func setView(){
        view.addSubview(containner)
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        containner.snp.makeConstraints{(make) in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        setCardView()
        setTableView()
    }
    
    func setCardView(){
        containner.addSubview(cardUser)
        cardUser.addSubview(cardImage)
        cardUser.addSubview(cardInfo)
        cardInfo.addSubview(userName)
        cardInfo.addSubview(userPhone)
        
        cardUser.snp.makeConstraints{(make) in
            make.top.left.right.equalTo(containner)
            make.height.equalTo(100)
        }
        
        cardImage.layer.cornerRadius = 30
        cardImage.snp.makeConstraints{(make) in
            make.top.left.equalTo(cardUser).inset(20)
            make.width.height.equalTo(60)
        }
        
        cardInfo.snp.makeConstraints{(make) in
            make.left.equalTo(cardImage.snp.right).offset(30)
            make.top.bottom.equalTo(cardImage)
            make.centerY.equalTo(cardUser)
        }
       

        userPhone.snp.makeConstraints{(make) in
            make.top.equalTo(userName.snp.bottom).offset(5)
        }
    }
    
    func setTableView(){
        containner.addSubview(menu)
        
        menu.snp.makeConstraints {(make) in
            make.top.equalTo(cardUser.snp.bottom)
            make.bottom.left.right.equalTo(containner).inset(10)
        }
        menu.delegate   = self
        menu.dataSource = self
        menu.separatorStyle = UITableViewCell.SeparatorStyle.none
        menu.register(MenuTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func setListController(){
        listMenu.append(Menu(icon:"break",name: "Báo cáo sự cố"))
        listMenu.append(Menu(icon:"fly",name: "Danh sách sự cố"))
        listMenu.append(Menu(icon:"acount",name: "Hồ sơ"))
        listMenu.append(Menu(icon:"setting",name: "Cài đặt"))
        listMenu.append(Menu(icon:"logout",name: "Đăng xuất"))
    }
    
   
}



extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMenu.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
            cell.menu = listMenu[indexPath.row]
          return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let menuOption = MenuOption(rawValue: indexPath.row)
    let name = listMenu[indexPath.row].name
        switch name {
        case "Báo cáo sự cố":
            let settingVC = CreateIssuesViewController()
            let settingNav = UINavigationController(rootViewController: settingVC)
            self.slideMenuController()?.changeMainViewController(settingNav, close: true)
        case "Hồ sơ":
            let settingVC = UpDateProfileViewController()
            let settingNav = UINavigationController(rootViewController: settingVC)
            self.slideMenuController()?.changeMainViewController(settingNav, close: true)
        case "Cài đặt":
            let settingVC = SettingViewController()
            let settingNav = UINavigationController(rootViewController: settingVC)
            self.slideMenuController()?.changeMainViewController(settingNav, close: true)
        case "Đăng xuất":
            self.slideMenuController()
            UserDefaults.standard.removeObject(forKey: "status")
            Switcher.updateRootVC()
        default:
            let settingVC = HomeViewController()
            let settingNav = UINavigationController(rootViewController: settingVC)
            self.slideMenuController()?.changeMainViewController(settingNav, close: true)
        }
    }
}
