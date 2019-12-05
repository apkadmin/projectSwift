//
//  DescriptionView.swift
//  demo23
//
//  Created by An Nguyen on 12/5/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class DescriptionView: UIView {

    let scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    let Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let contentView : UIView = {
        let label = UIView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(scrollView)
        configureViews()
    }
    
    func configureViews(){
        let margins = self.layoutMarginsGuide
        scrollView.snp.makeConstraints{(make) in
            make.leading.trailing.top.bottom.equalTo(self)
        }
        scrollView.addSubview(contentView)
        
        scrollView.addSubview(Label)
        Label.snp.makeConstraints{(make) in
            make.leading.trailing.top.bottom.equalTo(scrollView)
            make.height.equalTo(margins).multipliedBy(1)
        }

        
}

   required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
   }


}
