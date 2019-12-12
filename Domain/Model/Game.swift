//
//  Game.swift
//  Domain
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation

public struct Game: Codable {
    
    public let identifier: String
    public let name: String
    public let cover: URL
    public let rate: Double
    public let description: String
    
    public init(identifier: String,
                name: String,
                cover: URL,
                rate: Double,
                description: String) {
        self.identifier = identifier
        self.name = name
        self.cover = cover
        self.rate = rate
        self.description = description
    }
    
}
