//
//  GameCoordinator.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import UIKit
import Domain

final class GameCoordinator: Coordinator {
    
    // MARK: - Public Properties
    
    var presenter: UINavigationController
    var gameDetailController: GameDetailController?
    
    // MARK: - Private Properties
    
    private let gameRepository: GameRepositoryRepresentable
    
    // MARK: - Public Methods
    
    init(presenter: UINavigationController,
         gameRepository: GameRepositoryRepresentable) {
        self.presenter = presenter
        self.gameRepository = gameRepository
    }
    
    func start() {
        let viewModel = GameListViewModel(gameRepository: gameRepository)
        viewModel.delegate = self
        let controller = GameListController(viewModel: viewModel)
        presenter.show(controller, sender: nil)
    }
    
}

extension GameCoordinator: GameListViewModelDelegate {
    
    func gameListViewModelDidSelect(gameIdentifier: GameIdentifiable) {
        let viewModel = GameDetailViewModel(gameIdentifier: gameIdentifier,
                                            gameRepository: gameRepository)
        viewModel.delegate = self
        
        gameDetailController = GameDetailController(viewModel: viewModel)
//        gameDetailController!.modalPresentationStyle = .fullScreen
//        gameDetailController!.modalTransitionStyle = .crossDissolve
        
        presenter.present(gameDetailController!, animated: true)
    }
    
    func gameListViewModelDisplay(error: Error) {
        gameDetailController?.show(error: error)
    }
    
}

extension GameCoordinator: GameDetailViewModelDelegate {
    
    func gameDetailViewModelClose() {
        gameDetailController?.dismiss(animated: true)
    }
    
    func gameDetailViewModelDisplay(error: Error) {
        gameDetailController?.show(error: error)
    }
    
}
