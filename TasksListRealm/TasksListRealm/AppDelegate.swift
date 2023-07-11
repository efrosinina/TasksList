//
//  AppDelegate.swift
//  TasksListRealm
//
//  Created by Елизавета Ефросинина on 09/07/2023.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let navigationController = UINavigationController()
            navigationController.viewControllers = [ListViewController()]
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        return true
    }
}
