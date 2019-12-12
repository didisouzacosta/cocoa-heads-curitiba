//
//  GameViewModelExtension.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 12/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import Domain

extension GameViewModel: SpotlightItemRepresentable {
    
    var spotlightItemIdentifier: String {
        return identifier
    }
    
    var spotlightItemTitle: String? {
        return name
    }
    
    var spotlightItemContentDescription: String? {
        return description
    }
    
    var spotlightItemImageURL: URL? {
        return coverURL
    }
    
    var spotlightItemRating: NSNumber? {
        return NSNumber(value: rate)
    }
    
}
