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
    
    func GameDetailViewModelClose()
    
}

final class GameDetailViewModel {
    
    // MARK: - Public Properties
    
    var delegate: GameDetailViewModelDelegate?
    
    var name: String {
        return gameViewModel.name
    }
    
    var rateDescription: String {
        return gameViewModel.rateDescription
    }
    
    var coverURL: URL {
        return gameViewModel.coverURL
    }
    
    var description: String {
        return gameViewModel.description
    }
    
    // MARK: - Private Properties
    
    private let gameViewModel: GameViewModel
    
    // MARK: - Public Methods
    
    init(gameViewModel: GameViewModel) {
        self.gameViewModel = gameViewModel
    }
    
    func close() {
        delegate?.GameDetailViewModelClose()
    }
    
}
