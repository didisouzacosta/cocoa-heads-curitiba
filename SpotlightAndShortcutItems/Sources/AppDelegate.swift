//
//  AppDelegate.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import UIKit

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
        setupApplicationCoordinator(with: window!)
        return true
    }
    
    // MARK: - Private Methods
    
    private func setupApplicationCoordinator(with window: UIWindow) {
        applicationCoordinator = ApplicationCoordinator(presenter: UINavigationController())
        window.rootViewController = applicationCoordinator?.presenter
        window.makeKeyAndVisible()
        applicationCoordinator?.start()
    }

}

