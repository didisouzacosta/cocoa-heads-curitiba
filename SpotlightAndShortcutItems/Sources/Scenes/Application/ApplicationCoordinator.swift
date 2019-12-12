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
import CoreSpotlight

final class ApplicationCoordinator: Coordinator {
    
    // MARK: - Public Properties
    
    var presenter: UINavigationController
    
    // MARK: - Private Properties
    
    private let gameRepository: GameRepositoryRepresentable
    
    private var gameCoordinator: GameCoordinator?
    
    // MARK: - Public Methods
    
    init(presenter: UINavigationController,
         gameRepository: GameRepositoryRepresentable) {
        self.presenter = presenter
        self.gameRepository = gameRepository
    }
    
    func start() {
        gameCoordinator = GameCoordinator(presenter: presenter,
                                          gameRepository: gameRepository)
        gameCoordinator?.start()
    }
    
    // MARK: - Private Methods
    
    private func resetStack() {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: false)
        
        if presenter.viewControllers.isEmpty {
            start()
        } else {
            presenter.popToRootViewController(animated: false)
        }
    }
    
    private func present(game withIdentifier: GameIdentifiable) {
        resetStack()
        gameCoordinator?.gameListViewModelDidSelect(gameIdentifier: withIdentifier)
    }
    
}

extension ApplicationCoordinator {
    
    func start(with userAcvity: NSUserActivity) {
        switch userAcvity.activityType {
        case CSSearchableItemActionType:
            guard let identifier = userAcvity.userInfo?[CSSearchableItemActivityIdentifier] as? String,
                !identifier.isEmpty else {
                    return
            }
            present(game: identifier)
        default:
            start()
        }
    }
    
    func start(with shortuctItem: UIApplicationShortcutItem) {
        switch shortuctItem.type {
        case "BestGame":
            present(game: "34534tgefgdfg")
        case "AnotherGame":
            guard let identifier = shortuctItem.userInfo?["identifier"] else { return }
            present(game: "\(identifier)")
        default:
            break
        }
    }
    
}
