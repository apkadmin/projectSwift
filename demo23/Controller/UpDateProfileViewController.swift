//
//  UpDateProfileViewController.swift
//  demo23
//
//  Created by An Nguyen on 12/4/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit
import Photos
import Alamofire
import AlamofireObjectMapper

class UpDateProfileViewController: UIViewController {
    var imagePicker: UIImagePickerController!
    var imageLink:String = ""
    let scrollView = UIScrollView()
    let containerView = UIView()
    let roundProgressBar: RoundProgressBar = {
        let view = RoundProgressBar()
            view.backgroundColor = .blue
            view.progressBarWidth = 3
            view.progressBarTintColor = .gray
            view.progressBarProgressColor = .blue
            view.currentValue = 0.01
            view.layer.cornerRadius = 75
            view.isHidden = true
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        return view
    }()
    let userImageView : UIImageView = {
        let image = UIImageView()
            image.contentMode = .scaleAspectFill
            image.layer.cornerRadius = 75
            image.layer.masksToBounds = true
            image.image = UIImage(named: "user")
        return image
    }()
    let changeImageLabel : UIButton = {
        let label = UIButton()
        label.setTitle("Đổi ảnh đại diện", for: .normal)
        label.setTitleColor(UIColor.black, for: .normal)
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
        setImagePicker()
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
        action:#selector(saveInfo))
        self.edgesForExtendedLayout = UIRectEdge.top
        self.edgesForExtendedLayout = UIRectEdge.bottom
    }
    
    func setView(){
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(userImageView)
        containerView.addSubview(roundProgressBar)
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
        if let useravatar = UserDefaults.standard.string(forKey: USERIMAGE), !useravatar.isEmpty {
            let link = "\(ApiGateWay.baseURI)\(useravatar)"
            userImageView.dowloadFromServer(link: link)
        }
        userImageView.snp.makeConstraints{(make) in
            make.centerX.equalTo(containerView)
            make.top.equalTo(containerView).inset(20)
            make.height.width.equalTo(150)
        }
        changeImageLabel.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        changeImageLabel.snp.makeConstraints{(make) in
            make.top.equalTo(userImageView.snp.bottom).offset(20)
            make.centerX.equalTo(userImageView)
            make.height.equalTo(20)
            make.width.equalTo(400)
        }

        if let username = UserDefaults.standard.string(forKey: USERNAME), !username.isEmpty {
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
        
        if let userphone = UserDefaults.standard.string(forKey: USERPHONE), !userphone.isEmpty {
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
        
        if let useraddress = UserDefaults.standard.string(forKey: USERADDR), !useraddress.isEmpty {
            addressTextFieldAnimated.Input.text = useraddress
        }
        if addressTextFieldAnimated.Input.text != "" {
            addressTextFieldAnimated.textFieldDidBeginEditing(addressTextFieldAnimated.Input)
        }
        addressTextFieldAnimated.snp.makeConstraints{(make) in
            make.leading.trailing.equalTo(containerView).inset(50)
            make.top.equalTo(phoneTextFieldAnimated.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
       
        roundProgressBar.snp.makeConstraints{(make) in
            make.centerX.equalTo(containerView)
            make.top.equalTo(containerView).inset(20)
            make.height.width.equalTo(150)
        }
        
    }
    func setImagePicker(){
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    //set Acction
       //action show menu navbar
       @objc func showMenu(){
           self.slideMenuController()?.openLeft()
       }
    
    @objc func saveInfo(){
        if imageLink == "" || usernameTextFieldAnimated.Input.text == "" || addressTextFieldAnimated.Input.text == "" || phoneTextFieldAnimated.Input.text == "" {
            showToast(message: "Các trường không được bỏ trống")
        }
        else {
            let status = UserDefaults.standard.string(forKey: "status")
                   let setHeader = [
                       "Authorization": status
                   ]
                   let parameters: [String : Any] = [
                        "name": self.usernameTextFieldAnimated.Input.text,
                        "address": self.addressTextFieldAnimated.Input.text,
                        "phone": self.phoneTextFieldAnimated.Input.text,
                        "avatar": imageLink
                    ]
                   
                   Alamofire.request(ApiGateWay.updateProfileURI,method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: (setHeader as! HTTPHeaders)).responseObject { (response: DataResponse<UserInfoResponse>) in
                            let profileResponse = response.value
                            if profileResponse?.code == 0 {
                                if let res = profileResponse?.data {
                                   self.showToast(message: "Thành công")
                                    UserDefaults.standard.set(res.userProfile?.avatar, forKey: "useravatar")
                                    UserDefaults.standard.set(res.userProfile?.name, forKey: "username")
                                    UserDefaults.standard.set(res.userProfile?.phone, forKey: "userphone")
                                    UserDefaults.standard.set(res.userProfile?.address, forKey: "useraddress")
                                }
                            }
                        }
        }
    }
   
    @objc func selectImage() {
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
                DispatchQueue.main.async {
                    let alert =  UIAlertController(title:"Alert", message: "No camera", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert,animated: true, completion: nil)
                }
            }
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
extension UpDateProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage , image != nil {
         userImageView.image = image
        let imgData = UIImageJPEGRepresentation(image, 0.2)!
        if let status = UserDefaults.standard.string(forKey: TOKEN) {
        let setHeader = [
            "Authorization": status,
            "content-type": "multipart/form-data"
        ]
            roundProgressBar.isHidden = false
        Alamofire.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imgData, withName: "fileData",fileName: "image.png", mimeType: "image/png")
        },usingThreshold: UInt64.init(),to:ApiGateWay.uploadFileURI, method: .post,headers: (setHeader as! HTTPHeaders)) { (result) in
            switch result {
                case .success(let upload, _, _):
                    upload.uploadProgress{(process) in
                        if(process.fractionCompleted < 0.9){
                            self.roundProgressBar.currentValue = process.fractionCompleted
                        } else {
                            self.roundProgressBar.isHidden = true
                        }
                    }
                upload.responseObject { (response: DataResponse<UploadFileResponse>) in
                    let ImageResponse = response.value
                        if ImageResponse?.code == 0 {
                            if let res = ImageResponse?.data {
                                self.imageLink = res
                        }
                    }
                }
            case .failure(let error):
                self.showToast(message: "\(error)")
            }
        }
        }
        picker.dismiss(animated: true, completion: nil)
        }
    }

}
