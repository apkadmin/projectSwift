//
//  SettingTableViewCell.swift
//  demo23
//
//  Created by An Nguyen on 12/1/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    let cardTitle:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame(forAlignmentRect: CGRect(x:20,y:20,width: 20,height: 20))
        view.tintColor = UIColor.white
        view.textAlignment = .center
        view.font =  UIFont.systemFont(ofSize: 20.0)
        return view
    }()
    
    let cardView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewAndLayout()
    }
    


    func addSubViewAndLayout(){
        contentView.addSubview(cardView)
        cardView.center = contentView.center
        cardView.snp.makeConstraints{(make) in
            make.top.bottom.right.equalTo(contentView).inset(20)
            make.left.equalTo(contentView).inset(25)
        }
        cardTitle.textAlignment = .center
        cardTitle.center = contentView.center
        cardView.addSubview(cardTitle)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
