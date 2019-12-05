//
//  ImageCollectionViewCell.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "anh1")
        view.contentMode = .scaleToFill
        return view
    }()

    let deleteBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "delete"), for: .normal)
        return btn
    }()
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    func setLayout() {
        super.awakeFromNib()
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.backgroundColor = .white
        containerView.snp.makeConstraints{(make) in
            make.top.leading.trailing.bottom.equalTo(contentView).inset(5)
        }
        containerView.isUserInteractionEnabled = true
        imageView.snp.makeConstraints{(make) in
            make.width.height.equalTo(containerView)
        }
        
        contentView.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints{(make) in
            make.top.equalTo(containerView).offset(-10)
            make.trailing.equalTo(contentView).offset(10)
            make.width.height.equalTo(30)
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("Lỗi: chưa làm kiểu khởi tạo máy")
    }
}
