//
//  SceneDelegate.swift
//  demo23
//
//  Created by An Nguyen on 11/23/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
 
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let windowScene = (scene as? UIWindowScene) else {return}
        window?.windowScene = windowScene
            if let token = UserDefaults.standard.string(forKey: TOKEN), token != ""{
                let mainVC = HomeViewController()
                let slideVC = MenuViewController()
                let nav = UINavigationController(rootViewController: mainVC)
                let slideMenuController = SlideMenuController(mainViewController: nav, leftMenuViewController: slideVC)
                SlideMenuOptions.hideStatusBar = false
                window?.rootViewController = slideMenuController
            }else{
                window?.rootViewController = LoginViewController()
            }
       window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

}

