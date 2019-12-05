//
//  DetailIssuesViewController.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import AlamofireObjectMapper

struct Controller {
    var icon: UIImage
    var label: String
    var viewController: UIViewController
}

enum State {
    case no_process
    case processing
    case processed
}

class HomeViewController: UIViewController {
    var delegate: HomeControllerDelegate?
    let scrollView = UIScrollView()
    let containerView = UIView()
    let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Chưa xử lý", "Đang xử lý", "Đã xử lý"])
        segment.selectedSegmentIndex = 0
        segment.tintColor = UIColor.orange
        return segment
    }()
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    var listIssues: [Issue] = []
    var isState: State = .no_process
    var searchBar: UISearchBar!
    var isSearching: Bool = false
    
   override func viewDidLoad() {
       super.viewDidLoad()
       setNavigation()
       setView()
       setUpTableView()

     
    listIssues.append(Issue.init(id:1, status: "Chưa xử lý", address: "CT5 - Toà B3 - Khu sảnh A (gần bãi để xe E5asdfasdfasklhadflskfjaskjfa ;jkaspfasdjfpjioasdhsdfhbuiosdbuioasdfiodfnasnhfakjfhsadjfhasdljfhlaskfhlaskfhlsadjfkasdjfhsdkahfasiuhfkasfhaskdjfaksdjfaslkdfhlaskdfaskldjfkladjhfdklajfkasdjfkasjfklasdjfklasjflaskdhfasdfsdfas", title: "Vỡ ống nước", description: "Vỡ đường ống, nước chảy tung toé cống asdpbflkasdfklasdn,mf;asdm j;mj; n;ll 'lp     l bnkbn p        mk'kvjpjlhiocgjhccgjhpijcđang có dấu hiệu tăng dần theo thời gian",date:"12/12/2019",time:"8:19", images: ["user"]))
       // Do any additional setup after loading the view.
   }
     
   
   //set navigation
     func setNavigation(){
         navigationController?.navigationBar.isHidden = false
         navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu") ,style: .done, target: self, action: #selector(showMenu))
         navigationItem.title = "Chi tiết sự cố"
         navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
         navigationController?.navigationBar.barTintColor = .init(red: 255/255, green: 127/255, blue: 69/255, alpha: 1.0)
         navigationController?.navigationBar.tintColor = UIColor.white
         //        navigationController?.navigationBar.isTranslucent = true
         //     self.automaticallyAdjustsScrollViewInsets = true
         self.edgesForExtendedLayout = UIRectEdge.top
         self.edgesForExtendedLayout = UIRectEdge.bottom
     }
     
     func setView(){
         view.backgroundColor = .white
         view.addSubview(scrollView)
         scrollView.addSubview(containerView)
         scrollView.snp.makeConstraints{(make) in
             make.top.bottom.left.right.equalTo(view)
         }
         
         containerView.snp.makeConstraints{(make) in
             make.top.left.right.bottom.equalTo(scrollView)
             make.height.equalTo(600)
             make.width.equalTo(view).multipliedBy(1)
         }
         containerView.addSubview(segmentControl)
         segmentControl.snp.makeConstraints{(make) in
             make.top.left.right.equalTo(containerView).inset(20)
         }
          segmentControl.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
         containerView.addSubview(tableView)
         tableView.snp.makeConstraints{(make) in
             make.left.right.equalTo(segmentControl)
             make.top.equalTo(segmentControl.snp.bottom).offset(20)
            make.bottom.equalTo(scrollView)
         }

     }
   
     func setUpTableView(){
         tableView.delegate = self
         tableView.dataSource = self
         tableView.register(ListIssuesTableViewCell.self, forCellReuseIdentifier: "ListIssuesTableViewCell")
         tableView.rowHeight = 80
         tableView.tableFooterView = UIView()
     }
     
   
   //set Acction
     //action show menu navbar
     @objc func showMenu(){
           self.slideMenuController()?.openLeft()
     }
     @objc func segmentedValueChanged(_ sender: UISegmentedControl!){
         switch sender.selectedSegmentIndex {
         case 0:
             isState = .no_process
         case 1:
             isState = .processing
         case 2:
             isState = .processed
         default:
             return
         }
          tableView.reloadData()
     }
    
 }

 extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         switch isState {
         case .no_process:
             return listIssues.filter { $0.status == "Chưa xử lý"}.count
         case .processing:
             return listIssues.filter { $0.status == "Đang xử lý"}.count
         case .processed:
             return listIssues.filter { $0.status == "Đã xử lý"}.count
         }
     }
 
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ListIssuesTableViewCell", for: indexPath) as! ListIssuesTableViewCell
         switch isState {
         case .no_process:
             cell.issue = listIssues.filter { $0.status == "Chưa xử lý"}[indexPath.row]
         case .processing:
             cell.issue = listIssues.filter { $0.status == "Đang xử lý"}[indexPath.row]
         case .processed:
            cell.issue = listIssues.filter { $0.status == "Đã xử lý"}[indexPath.row]
         }
         return cell
     }
 
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print(listIssues[indexPath.row].id)
         let detailVC = DetailIssuesViewController()
         switch isState {
         case .no_process:
             detailVC.issue = listIssues.filter { $0.status == "Chưa xử lý"}[indexPath.row]
         case .processing:
             detailVC.issue = listIssues.filter { $0.status == "Đang xử lý"}[indexPath.row]
         case .processed:
            detailVC.issue = listIssues.filter { $0.status == "Đã xử lý"}[indexPath.row]
         }
 
         self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
         self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
         navigationController?.pushViewController(detailVC, animated: true)
     }
 }
 
 
