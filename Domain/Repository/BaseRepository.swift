//
//  BaseRepository.swift
//  Domain
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation

public class BaseRepository<T: Codable>: RepositoryRepresentable {
    
    public func fetch(by identifier: String,
                      completion: (Result<T?, Error>) -> Void) {}
    
    public func fetchAll(completion: (Result<[T], Error>) -> Void) {}
    
}
