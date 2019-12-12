//
//  SpotlightItemRepresentable.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 12/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import CoreSpotlight
import MobileCoreServices
import Kingfisher

protocol SpotlightItemRepresentable {
    var spotlightItemIdentifier: String { get }
    var spotlightItemTitle: String? { get }
    var spotlightItemContentDescription: String? { get }
    var spotlightItemImageURL: URL? { get }
    var spotlightItemRating: NSNumber? { get }
}

extension SpotlightItemRepresentable {
    
    func searchableItemAttributes(completion: @escaping (CSSearchableItemAttributeSet) -> Void) {
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        attributeSet.identifier = spotlightItemIdentifier
        attributeSet.title = spotlightItemTitle
        attributeSet.contentDescription = spotlightItemContentDescription
        attributeSet.rating = spotlightItemRating
        
        if let thumbnailURL = spotlightItemImageURL {
            DispatchQueue.global().async {
                attributeSet.thumbnailData = try? Data(contentsOf: thumbnailURL)
                DispatchQueue.main.async {
                    completion(attributeSet)
                }
            }
        } else {
            completion(attributeSet)
        }
    }
    
}
