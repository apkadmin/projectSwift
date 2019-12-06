//
//  ListIssuesTableViewCell.swift
//  demo23
//
//  Created by An Nguyen on 12/5/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class ListIssuesTableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
          let label = UILabel()
          label.text = "Vỡ ống nước"
          label.font = UIFont.boldSystemFont(ofSize: 18)
          return label
      }()
      
      let addressLabel: UILabel = {
          let label = UILabel()
          label.text = "CT07 - Hoa phượng 6 chung cư Bắc Hà"
          label.font = UIFont.systemFont(ofSize: 16)
          return label
      }()
      
      let timeLabel: UILabel = {
          let label = UILabel()
          label.text = "08:52"
          label.font = UIFont.systemFont(ofSize: 16)
          return label
      }()
      
      let dateLabel: UILabel = {
          let label = UILabel()
          label.text = "20/10/2019"
          label.font = UIFont.systemFont(ofSize: 16)
          return label
      }()
      
      var issue: Issue? {
          didSet {
            if let issue = issue {
                  titleLabel.text = issue.title
                  addressLabel.text = issue.address
                  dateLabel.text = issue.date
                  timeLabel.text = issue.time
              }
          }
      }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupLayout()
        // Configure the view for the selected state
    }

    func setupLayout(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(dateLabel)
        
        titleLabel.snp.makeConstraints{(make) in
            make.top.left.equalTo(contentView).inset(16)
            make.width.equalTo(contentView).dividedBy(1.5)
        }
        timeLabel.snp.makeConstraints{(make) in
            make.top.equalTo(titleLabel)
            make.right.equalTo(contentView).inset(16).priority(1)
        }
        addressLabel.snp.makeConstraints{(make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalTo(titleLabel)
            make.width.equalTo(contentView).dividedBy(1.5)
            make.bottom.equalTo(contentView).inset(16)
        }
        dateLabel.snp.makeConstraints{(make) in
            make.top.bottom.equalTo(addressLabel)
            make.right.equalTo(timeLabel).priority(1)
        }
        
    }
}
