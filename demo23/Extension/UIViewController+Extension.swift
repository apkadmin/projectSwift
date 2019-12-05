//
//  UIViewController+Extension.swift
//  LibrayDemo
//
//  Created by Tào Quỳnh on 6/5/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setupSlideMenuItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "menu")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
    }
    
    func removeSlideMenuItem(){
        self.navigationItem.leftBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
    }
}
