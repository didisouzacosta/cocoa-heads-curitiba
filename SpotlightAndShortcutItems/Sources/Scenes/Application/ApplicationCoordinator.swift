//
//  ApplicationCoordinator.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import UIKit
import Domain

final class ApplicationCoordinator: Coordinator {
    
    // MARK: - Public Properties
    
    var presenter: UINavigationController
    
    // MARK: - Public Methods
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let gameCoordinator = GameCoordinator(presenter: presenter,
                                              gameRepository: GameRepository())
        gameCoordinator.start()
    }
    
}
