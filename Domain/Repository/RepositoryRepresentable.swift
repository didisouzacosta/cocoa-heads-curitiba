//
//  RepositoryRepresentable.swift
//  Domain
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation

public protocol RepositoryRepresentable {
    
    associatedtype T: Codable
    
    func fetch(by identifier: String,
               completion: (Result<T?, Error>) -> Void)
    
    func fetchAll(completion: (Result<[T], Error>) -> Void)
    
}
