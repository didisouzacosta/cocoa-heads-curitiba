//
//  PageSliderViewCell.swift
//  Common
//
//  Created by Adriano Souza Costa on 12/04/19.
//  Copyright © 2019 Consulta Remedios. All rights reserved.
//

import UIKit

final class PageSliderViewCell: UICollectionViewCell {
    
    // MARK: - Public Methods
    
    static var reuseIdentifier: String {
        return "PageSliderViewCell"
    }
    
    func setup(with page: UIView) {
        pinning(page)
    }
    
}
