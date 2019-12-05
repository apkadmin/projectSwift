//
//  DetailIssuesViewController.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class DetailIssuesViewController: UIViewController {
    var issue : Issue?
      let scrollView = UIScrollView()
      let containerView = UIView()
    let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Trạng thái:"
        return label
    }()
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Địa chỉ xảy ra vấn để"
        return label
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tiêu đề"
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Nội dung"
        return label
    }()
    let statusValueLabel : UILabel = {
        let label = UILabel()
        label.textColor = .orange
        return label
    }()
    let addressTextView : UITextView = {
        let text = UITextView()
        text.isUserInteractionEnabled = false
        text.font = UIFont.systemFont(ofSize: 20)
//        text.setLeftPaddingPoints(10)
        return text
    }()
    let titleTextField : UITextField = {
        let text = UITextField()
        text.setBottomBorder()
        text.setLeftPaddingPoints(10)
        text.isUserInteractionEnabled = false
        return text
    }()

    let descriptionView : UIView = {
        let view = UIView()
        return view
    }()
    let descriptionTextView : UITextView = {
        let text = UITextView()
        text.isUserInteractionEnabled = false
        text.font = UIFont.systemFont(ofSize: 20)
        text.showsHorizontalScrollIndicator = true
      return text
    }()
    let imageCollectionView : UICollectionView = {
        let layout  = UICollectionViewFlowLayout()
        let cllection = UICollectionView(frame: CGRect.zero, collectionViewLayout:layout)
            cllection.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        layout.scrollDirection = .horizontal
        return cllection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setView()
        setImageCollection()
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
//        issue = Issue.init(id:1,status: "Chưa xử lý", address: "CT5 - Toà B3 - Khu sảnh A (gần bãi để xe E5", title: "Vỡ ống nước", description: "Vỡ đường ống, nước chảy tung toé cống đang có dấu hiệu tăng",date:"12/12/2019",time:"8:19", images: ["user"])
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        scrollView.snp.makeConstraints{(make) in
            make.top.leading.trailing.bottom.equalTo(view).inset(0)
        }
       containerView.snp.makeConstraints{(make) in
            make.leading.trailing.top.bottom.equalTo(scrollView)
            make.width.equalTo(view).multipliedBy(1)
            make.height.equalTo(600)
        }
        containerView.addSubview(statusLabel)
       
          statusLabel.snp.makeConstraints{(make) in
              make.top.left.equalTo(containerView).inset(20)
              make.width.equalTo(90)
          }
          
          containerView.addSubview(statusValueLabel)
          statusValueLabel.text = issue?.status
          statusValueLabel.snp.makeConstraints{(make) in
              make.left.equalTo(statusLabel.snp.right).offset(5)
              make.top.equalTo(statusLabel)
              make.right.equalTo(containerView).inset(20)
          }
          
          containerView.addSubview(addressLabel)
          addressLabel.snp.makeConstraints{(make) in
              make.top.equalTo(statusLabel.snp.bottom).offset(40)
              make.left.equalTo(statusLabel)
              make.right.equalTo(statusValueLabel)
          }
          
          containerView.addSubview(addressTextView)
          addressTextView.text = issue?.address
          addressTextView.snp.makeConstraints{(make) in
              make.top.equalTo(addressLabel.snp.bottom).offset(10)
              make.left.right.equalTo(addressLabel)
          }
          
          containerView.addSubview(titleLabel)
          titleLabel.snp.makeConstraints{(make) in
              make.top.equalTo(addressTextView.snp.bottom).offset(40)
              make.left.right.equalTo(addressTextView)
          }
          
          containerView.addSubview(titleTextField)
          titleTextField.text = issue?.title
          titleTextField.snp.makeConstraints{(make) in
              make.top.equalTo(titleLabel.snp.bottom).offset(10)
              make.left.right.equalTo(addressLabel)
          }
          
          containerView.addSubview(descriptionLabel)
          descriptionLabel.snp.makeConstraints{(make) in
              make.top.equalTo(titleTextField.snp.bottom).offset(40)
              make.left.right.equalTo(addressTextView)
          }
          containerView.addSubview(descriptionView)
          descriptionView.snp.makeConstraints{(make) in
              make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
              make.left.right.equalTo(addressLabel)
              make.height.equalTo(200)
          }
          
          descriptionView.addSubview(descriptionTextView)
          descriptionTextView.text = issue?.description
          descriptionTextView.snp.makeConstraints{(make) in
              make.top.bottom.left.right.equalTo(descriptionView)
          }
        containerView.addSubview(imageCollectionView)
        imageCollectionView.snp.makeConstraints{(make) in
            make.top.equalTo(descriptionView.snp.bottom).offset(30)
            make.left.right.equalTo(containerView)
            make.height.equalTo(100)
        }
      }
    func setImageCollection(){
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.backgroundColor = .white
        imageCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    //set Acction
      //action show menu navbar
      @objc func showMenu(){
          self.slideMenuController()?.openLeft()
      }
    
}

extension DetailIssuesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = 100
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (issue?.images.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        let imageid = issue?.images
        cell.imageView.image = UIImage(named:(imageid?[indexPath.row])!)
        return cell
    }
}
