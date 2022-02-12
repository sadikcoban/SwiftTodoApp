//
//  AppDelegate.swift
//  SwiftTodoApp
//
//  Created by Sadık Çoban on 12.02.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let todosVC = TodosViewController()
        let navigationVC = UINavigationController(rootViewController: todosVC)
        TodosConfigurator.configureModule(viewController: todosVC)
        
        window = UIWindow()
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return true
    }
}

