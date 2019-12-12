//
//  GameRepositoryRepresentable.swift
//  Domain
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation

public typealias GameRepositoryRepresentable = BaseRepository<Game>

public final class GameRepository: GameRepositoryRepresentable {
    
    // MARK: - Private Properties
    
    private var games: [T] = []
    
    // MARK: - Public Methods
    
    public override init() {
        guard let url = Bundle(identifier: "com.cocoaheads.Domain")?
            .url(forResource: "GamesData", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            games = try decoder.decode([Game].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public override func fetch(by identifier: String,
                               completion: (Result<T?, Error>) -> Void) {
        let game = games.first { $0.identifier == identifier }
        completion(.success(game))
    }
    
    public override func fetchAll(completion: (Result<[T], Error>) -> Void) {
        completion(.success(games))
    }
    
}
