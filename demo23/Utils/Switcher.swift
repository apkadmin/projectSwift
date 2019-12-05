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
        let status = UserDefaults.standard.string(forKey: "status")
        var rootVC : UIViewController?
//       let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//            print(status)
        
         let mainVC = HomeViewController()
        //            let mainVC = LoginViewController()

         let navigation = UINavigationController(rootViewController: mainVC)
        if(status != nil ){
//            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") as! ViewController
//            storyboard.instantiateViewController(withIdentifier: "MainView")
               let slideVC = MenuViewController()
               let nav = UINavigationController(rootViewController: mainVC)

               let slideMenuController = SlideMenuController(mainViewController: nav, leftMenuViewController: slideVC)
                       SlideMenuOptions.hideStatusBar = false
            rootVC = slideMenuController
        }else{
                rootVC = LoginViewController()
//            rootVC = storyboard.instantiateViewController(withIdentifier: "LoginView")
//              rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
        }

        UIApplication.shared.keyWindow?.rootViewController = rootVC;
//        let appdelegate = UIApplication.shared.delegate as! AppDelegate
//        appdelegate.window?.rootViewController = rootVC
    }
    
}
