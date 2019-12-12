//
//  ShortcutItemManager.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 12/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import UIKit
import Domain

final class ShortcutItemManager {
    
    func register(game: GameViewModel) {
        let shortcutItem = UIApplicationShortcutItem(type: "AnotherGame",
                                                     localizedTitle: game.name,
                                                     localizedSubtitle: nil,
                                                     icon: .init(type: .favorite),
                                                     userInfo: ["identifier": game.identifier as NSSecureCoding])
        var shortcutItems = UIApplication.shared.shortcutItems ?? []
        
        if !shortcutItems.isEmpty {
            shortcutItems.removeLast()
        }
        
        UIApplication.shared.shortcutItems = shortcutItems + [shortcutItem]
    }
    
}
