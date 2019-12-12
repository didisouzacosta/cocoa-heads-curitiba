//
//  SpotlightItemRepresentable.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 12/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import UIKit
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
        
        if let imageURL = spotlightItemImageURL {
            KingfisherManager.shared.retrieveImage(with: imageURL) { response in
                do {
                    let result = try response.get()
                    let imageData = result.image.jpegData(compressionQuality: 0.8)
                    attributeSet.thumbnailData = imageData
                } catch {
                    print(error.localizedDescription)
                }
                
                completion(attributeSet)
            }
        } else {
            completion(attributeSet)
        }
    }
    
}
