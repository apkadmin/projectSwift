//
//  SettingViewController.swift
//  demo23
//
//  Created by An Nguyen on 12/1/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    
    
    let logoutBtn = UIButton()
    let menuImage = UIImage()
    let containerView = UIView()
    let mytableView: UITableView = {
    let table = UITableView()
        return table
    }()
    let data: [String] = ["Đổi mật khẩu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setNavigation()
        setView()
    }

    //set navigation
    func setNavigation(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu") ,style: .done, target: self, action: #selector(showMenu))
        navigationItem.title = "Cài đặt"
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .init(red: 255/255, green: 127/255, blue: 69/255, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.white
        //        navigationController?.navigationBar.isTranslucent = true
        self.automaticallyAdjustsScrollViewInsets = true
        self.edgesForExtendedLayout = UIRectEdge.top
        self.edgesForExtendedLayout = UIRectEdge.bottom
    }

    //set safearea view
    func setView(){
        containerView.backgroundColor = UIColor.white
        //set up container
        view.addSubview(containerView)
        containerView.snp.makeConstraints{(make) in
            make.top.bottom.left.right.equalTo(view)
        }
        //setup table view
        containerView.addSubview(mytableView)
        mytableView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(0)
        }
        mytableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "Cell")
        mytableView.delegate = self
        mytableView.dataSource = self

    }

    //set Acction
    //action show menu navbar
    @objc func showMenu(){
        self.slideMenuController()?.openLeft()
    }
    
    //on Logout
    @objc func logout() {
    UserDefaults.standard.set(false, forKey: "status")
    Switcher.updateRootVC()
    }
}

extension SettingViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return data.count
    }
          
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
              return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SettingTableViewCell
              cell.cardTitle.text = data[indexPath.row]
              cell.cardTitle.textAlignment = .center
             return cell
    }
}
