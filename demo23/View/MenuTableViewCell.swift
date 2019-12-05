//
//  MenuTableViewCell.swift
//  demo23
//
//  Created by An Nguyen on 12/1/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    var menu : Menu?{
           didSet {
            icon.image = UIImage(named: menu!.icon)
            name.text = menu?.name
           }
       }
    let icon : UIImageView = {
        let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let name: UILabel = {
        let view = UILabel()
        return view
    }()
    
    var viewControler: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
          addSubViewAndLayout()
      }
    

    
    func addSubViewAndLayout(){
        contentView.addSubview(icon)
        contentView.addSubview(name)
        
        icon.snp.makeConstraints{(make) in
            make.width.height.equalTo(30)
            make.left.equalTo(contentView).inset(10)
            make.top.equalTo(contentView).inset(10)
        }
        
        name.snp.makeConstraints{(make) in
            make.top.bottom.equalTo(icon)
            make.left.equalTo(icon.snp.right).offset(20)
            make.right.equalTo(contentView).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
