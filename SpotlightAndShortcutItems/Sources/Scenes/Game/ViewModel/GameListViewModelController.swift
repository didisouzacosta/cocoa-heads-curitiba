//
//  GameListViewModel.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import Domain

protocol GameListViewModelDelegate {
    
    func gameListViewModelDidSelect(gameIdentifier: GameIdentifiable)
    func gameListViewModelDisplay(error: Error)
    
}

final class GameListViewModel {
    
    // MARK: - Public Properties
    
    var delegate: GameListViewModelDelegate?
    
    private(set) var games: [GameViewModel] = []
    
    // MARK: - Private Properties
    
    private let gameRepository: GameRepositoryRepresentable
    private let spotlightManager = SpotlightManager()
    
    // MARK: - Public Methods
    
    init(gameRepository: GameRepositoryRepresentable) {
        self.gameRepository = gameRepository
    }
    
    func loadGames(completion: @escaping () -> Void) {
        gameRepository.fetchAll { [weak self] response in
            do {
                self?.games = try response.get()
                    .map { GameViewModel(game: $0) }
                    .sorted(by: { (a, b) -> Bool in
                        return a.rate > b.rate
                    })
            } catch {
                delegate?.gameListViewModelDisplay(error: error)
            }
            completion()
        }
    }
    
    func didSelect(game: GameViewModel) {
        spotlightManager.index(item: game)
        delegate?.gameListViewModelDidSelect(gameIdentifier: game)
    }
    
}
