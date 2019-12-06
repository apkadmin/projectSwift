//
//  CreateIssuesViewController.swift
//  demo23
//
//  Created by An Nguyen on 12/4/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit
import Photos

class CreateIssuesViewController: UIViewController {
    var imagePicker: UIImagePickerController!
    var listImage: [String] = []
    let scrollView = UIScrollView()
    let containerView = UIView()
    let addressTextFieldAnimated = UITextFieldAnimated()
    let titleTextFieldAnimated = UITextFieldAnimated()
    let descriptionLabel = UILabel()
    let descriptionTextView = UITextView()
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
            make.height.equalTo(100)
        }
        
        containerView.addSubview(imageCollectionView)
       imageCollectionView.snp.makeConstraints{(make) in
           make.top.equalTo(descriptionTextView.snp.bottom).offset(30)
           make.left.right.equalTo(containerView)
           make.height.equalTo(110)
       }
        
    }
    
    func setImageCollection(){
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.backgroundColor = .white
        imageCollectionView.layer.borderColor = UIColor.gray.cgColor
        imageCollectionView.layer.borderWidth = 1
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
       //action show menu navbar
    @objc func showMenu(){
           self.slideMenuController()?.openLeft()
       }
    
    @objc func sendIssues(){
        print("save")
    }
    func selectImage() {
        let alert = UIAlertController(title: "App", message: "Select Image", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Close", style: .default, handler: nil)
        let libray = UIAlertAction(title: "Library", style: .default, handler: {(_) in print("Select image from library")
            
             self.fromLibrary()
        })
        let camera = UIAlertAction(title: "Camera", style: .default, handler: {(_) in print("Select image from Camera")
            self.fromCamera()
           
        })
        
        alert.addAction(camera)
        alert.addAction(libray)
        alert.addAction(cancel)

        present(alert,animated: true,completion: nil)
    }
    
    func confirm(message: String, viewController: UIViewController?, success: @escaping ()-> Void){
          let alert = UIAlertController(title: "NoiBai App", message: message, preferredStyle: .alert)
              let action = UIAlertAction(title: "OK", style: .default, handler: nil)
              alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }

    func setting(){
        let meessage = "App can accest the picture and library. Image not sharing if you not accept"
        confirm(message: meessage, viewController: self){
            guard let settingsURI = URL(string: UIApplicationOpenSettingsURLString)else { return }
            if UIApplication.shared.canOpenURL(settingsURI){
                if #available(IOS 10.0, *){
                    UIApplication.shared.openURL(settingsURI)
                } else{
                    UIApplication.shared.openURL(settingsURI)
                }
            }
        }
    }
    
    private func fromLibrary(){
        func choosePhoto(){
            
            DispatchQueue.main.async {
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                self.imagePicker.modalPresentationStyle = .popover
              self.present(self.imagePicker,animated: true, completion: nil)
            }
                        
        }
        let status = PHPhotoLibrary.authorizationStatus()
        if status == PHAuthorizationStatus.authorized {
            //quyen dc cap
            choosePhoto()
        }else if (status == PHAuthorizationStatus.denied){
            //quyen bi tu choi
            setting()
        } else if(status == PHAuthorizationStatus.notDetermined){
            PHPhotoLibrary.requestAuthorization({(newStatus) in
                if (newStatus == PHAuthorizationStatus.authorized){
                    choosePhoto()
                }
                else {
                    print("Not permision accest library")
                    self.setting()
                }
            })
        } else if (status == PHAuthorizationStatus.restricted){
            //truy cap bi han che
            print("Restricted access")
            setting()
        }

    }
    func fromCamera(){
        func tackePhoto(){
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.imagePicker.cameraCaptureMode = .photo
                self.imagePicker.cameraDevice = .front
                self.imagePicker.modalPresentationStyle = .fullScreen
                DispatchQueue.main.async {
                    self.present(self.imagePicker,animated: true, completion: nil)
                }
            } else {
                print("abc")
                DispatchQueue.main.async {
                    let alert =  UIAlertController(title:"Alert", message: "No camera", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert,animated: true, completion: nil)
                }
            }
        }
    }
}
extension CreateIssuesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = 100
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listImage.count + 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        if indexPath.row == listImage.count {
            cell.imageView.isHidden = true
            cell.uploadBtn.isHidden = false
            cell.deleteBtn.isHidden = true
            cell.didUpload = { self.selectImage() }
        } else {
            cell.imageView.image = UIImage(named:listImage[indexPath.row])
        }
        return cell
    }
}

extension CreateIssuesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info as? UIImage else {
                    print("error: \(info)")
                    return
                }
        
        imageCollectionView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}
