//
//  Switcher.swift
//  demo23
//
//  Created by An Nguyen on 12/1/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//
import Foundation
import UIKit

class Switcher {
    static func updateRootVC(){
        let status = UserDefaults.standard.string(forKey: TOKEN)
        var rootVC : UIViewController?
        let mainVC = HomeViewController()
         let navigation = UINavigationController(rootViewController: mainVC)
        if(status != nil ){
            let slideVC = MenuViewController()
            let nav = UINavigationController(rootViewController: mainVC)
            let slideMenuController = SlideMenuController(mainViewController: nav, leftMenuViewController: slideVC)
            SlideMenuOptions.hideStatusBar = false
            rootVC = slideMenuController
        }else{
                rootVC = LoginViewController()
        }
        UIApplication.shared.keyWindow?.rootViewController = rootVC;
   }
}
