//
//  GameViewModel.swift
//  Domain
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation

public struct GameViewModel: GameIdentifiable {
    
    // MARK - Public Properties
    
    public var identifier: String {
        return game.identifier
    }
    
    public var name: String {
        return game.name
    }
    
    public var coverURL: URL {
        return game.cover
    }
    
    public var rate: Double {
        return game.rate
    }
    
    public var description: String {
        return game.description
    }
    
    public var rateDescription: String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: game.rate)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16
        return "\(String(formatter.string(from: number) ?? ""))/5"
    }
    
    // MARK - Private Properties
    
    private let game: Game
    
    // MARK - Public Methods
    
    public init (game: Game) {
        self.game = game
    }
    
}
