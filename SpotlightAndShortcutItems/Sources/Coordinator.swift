//
//  Coordinator.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var presenter: UINavigationController { get }
    
    func start()
    
}
