//
//  UIViewControllerExtension.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func show(error: Error,
              completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Ocorreu um erro",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default))
        present(alert,
                animated: true,
                completion: completion)
    }
    
}
