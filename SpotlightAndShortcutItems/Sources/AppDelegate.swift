//
//  AppDelegate.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import UIKit
import Domain

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Public Properties
    
    var window: UIWindow?
    
    // MARK: - Private Properties
    
    private var applicationCoordinator: ApplicationCoordinator?

    // MARK: - Public Methods
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        applicationCoordinator = ApplicationCoordinator(presenter: UINavigationController(),
                                                        gameRepository: GameRepository())
        window?.rootViewController = applicationCoordinator?.presenter
        window?.makeKeyAndVisible()
        applicationCoordinator?.start()
        
        if let shortcutItem = launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            applicationCoordinator?.start(with: shortcutItem)
        }
        
        return true
    }
    
    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        applicationCoordinator?.start(with: userActivity)
        return true
    }
    
    func application(_ application: UIApplication,
                     performActionFor shortcutItem: UIApplicationShortcutItem,
                     completionHandler: @escaping (Bool) -> Void) {
        applicationCoordinator?.start(with: shortcutItem)
        completionHandler(true)
    }

}

