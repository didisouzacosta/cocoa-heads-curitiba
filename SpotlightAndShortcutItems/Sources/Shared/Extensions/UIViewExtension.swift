//
//  UIViewExtension.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 11/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func pinning(_ view: UIView) {
        view.frame = CGRect(origin: .zero, size: frame.size)
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}
