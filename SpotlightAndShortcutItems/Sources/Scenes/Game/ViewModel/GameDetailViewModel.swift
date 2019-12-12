//
//  GameDetailViewModel.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import Domain

protocol GameDetailViewModelDelegate {
    
    func gameDetailViewModelClose()
    func gameDetailViewModelDisplay(error: Error)
    
}

final class GameDetailViewModel {
    
    // MARK: - Public Properties
    
    var delegate: GameDetailViewModelDelegate?
    
    // MARK: - Private Properties
    
    private let gameIdentifier: GameIdentifiable
    private let gameRepository: GameRepositoryRepresentable
    
    // MARK: - Public Methods
    
    init(gameIdentifier: GameIdentifiable,
         gameRepository: GameRepositoryRepresentable) {
        self.gameIdentifier = gameIdentifier
        self.gameRepository = gameRepository
    }
    
    func loadGameDetail(completion: (GameViewModel) -> Void) {
        gameRepository.fetch(by: gameIdentifier.identifier) { response in
            do {
                guard let game = try response.get() else { return }
                completion(GameViewModel(game: game))
            } catch {
                delegate?.gameDetailViewModelDisplay(error: error)
            }
        }
    }
    
    func close() {
        delegate?.gameDetailViewModelClose()
    }
    
}
