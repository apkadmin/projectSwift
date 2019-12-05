//
//  AppDelegate.swift
//  demo23
//
//  Created by An Nguyen on 11/23/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
@available(IOS 13.0, *)
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let status = UserDefaults.standard.string(forKey: "status")
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(IOS 13.0, *){

        }else {
            
            window = UIWindow(frame: UIScreen.main.bounds)
          if(status != nil ){
                let mainVC = HomeViewController()
                let navigation = UINavigationController(rootViewController: mainVC)
                let slideVC = MenuViewController()
                let nav = UINavigationController(rootViewController: mainVC)

                let slideMenuController = SlideMenuController(mainViewController: nav, leftMenuViewController: slideVC)
            SlideMenuOptions.hideStatusBar = false
            window?.rootViewController = slideMenuController
//                window?.rootViewController = navigation
            }else{
                window?.rootViewController = LoginViewController()
            }
            window?.makeKeyAndVisible()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
//    func switchViewController() {
//
//        // switch root view controllers
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let nav = storyboard.instantiateViewController(withIdentifier: "MainView")
//
//        self.window?.rootViewController = nav
//
//    }
//
//    func switchLoginController() {
//
//        // switch back to view controller 1
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let nav = storyboard.instantiateViewController(withIdentifier: "LoginView")
//        self.window?.rootViewController = nav
//    }

}

