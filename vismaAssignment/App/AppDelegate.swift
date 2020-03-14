//
//  AppDelegate.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let dependencyContainer = AppDependencyContainer()
    var navController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let projectsViewController = dependencyContainer.makeProjectsViewController()
        navController = UINavigationController(rootViewController: projectsViewController)
        navController?.modalPresentationStyle = .fullScreen

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}
