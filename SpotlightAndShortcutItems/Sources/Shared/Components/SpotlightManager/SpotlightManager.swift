//
//  SpotlightManager.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 12/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import CoreSpotlight

final class SpotlightManager {
    
    // MARK: - Private Properties
    
    private let domain: String
    private let searchableIndex: CSSearchableIndex
    
    // MARK: - Public Methods
    
    init(domain: String = Bundle.main.bundleIdentifier!,
         searchableIndex: CSSearchableIndex = CSSearchableIndex.default()) {
        self.domain = domain
        self.searchableIndex = searchableIndex
    }
    
    func index(item: SpotlightItemRepresentable,
               completion: ((Error?) -> Void)? = nil) {
        item.searchableItemAttributes { [weak self] attributes in
            guard let self = self else { return }
            let searcheableItem = CSSearchableItem(uniqueIdentifier: item.spotlightItemIdentifier,
                                                   domainIdentifier: self.domain,
                                                   attributeSet: attributes)
            self.searchableIndex.indexSearchableItems([searcheableItem],
                                                      completionHandler: completion)
        }
    }
    
    func deindex(identifier: String,
                 completion: ((Error?) -> Void)? = nil) {
        searchableIndex.deleteSearchableItems(withIdentifiers: [identifier],
                                              completionHandler: completion)
    }
    
}
