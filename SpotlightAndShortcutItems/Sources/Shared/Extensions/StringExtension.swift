//
//  StringExtension.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 12/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import Domain

extension String: GameIdentifiable {
    
    public var identifier: String {
        return self
    }
    
}
