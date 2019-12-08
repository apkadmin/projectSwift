//
//  ImageCollectionViewCell.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    var didUpload: (()->Void)?
    var actionTabViewController : CreateIssuesViewController?
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "anh1")
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 10
        return view
    }()

    let deleteBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "delete"), for: .normal)
        btn.isHidden = true
        return btn
    }()
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    let uploadBtn: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "ic_add"), for: .normal)
        btn.isHidden = true
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        return btn
    }()
    let roundProgressBar: RoundProgressBar = {
        let view = RoundProgressBar()
        view.backgroundColor = .blue
        view.progressBarWidth = 3
        view.progressBarTintColor = .gray
        view.progressBarProgressColor = .blue
        view.currentValue = 0.01
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.isHidden = true
        return view
    }()
    func setLayout() {
        super.awakeFromNib()
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.backgroundColor = .white
        containerView.addSubview(roundProgressBar)
        containerView.snp.makeConstraints{(make) in
            make.top.leading.trailing.bottom.equalTo(contentView).inset(5)
        }
        containerView.isUserInteractionEnabled = true
        imageView.snp.makeConstraints{(make) in
            make.width.height.equalTo(containerView)
        }
        containerView.addSubview(uploadBtn)
        uploadBtn.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        uploadBtn.snp.makeConstraints{(make) in
            make.width.height.equalTo(containerView)
        }
        contentView.addSubview(deleteBtn)
        deleteBtn.addTarget(self, action: #selector(onDeleteImage), for: .touchUpInside)
        deleteBtn.snp.makeConstraints{(make) in
            make.top.equalTo(containerView).offset(-10)
            make.trailing.equalTo(contentView).offset(10)
            make.width.height.equalTo(30)
        }
        
        roundProgressBar.snp.makeConstraints{(make) in
            make.top.bottom.leading.trailing.equalTo(containerView)
        }
    }
    
    @objc func selectImage(){
        didUpload?()
    }
    
    @objc func onDeleteImage(){
        actionTabViewController!.deleteCell(cell:self)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("Lỗi: chưa làm kiểu khởi tạo máy")
    }
}
