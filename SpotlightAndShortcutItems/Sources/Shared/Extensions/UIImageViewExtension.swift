//
//  UIImageViewExtension.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 11/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import UIKit
import Kingfisher

public extension UIImageView {
    
    func load(from url: URL?,
              placeholder: UIImage? = UIImage(named: "placeholder")) {
        guard let url = url else {
            self.image = placeholder
            return
        }
        
        self.image = placeholder
        
        self.kf.setImage(with: url,
                         placeholder: placeholder,
                         options: [.transition(.fade(1)), .cacheOriginalImage])
    }
    
}
