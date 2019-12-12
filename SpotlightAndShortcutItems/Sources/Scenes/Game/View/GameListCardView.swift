//
//  GameListViewCell.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 11/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import UIKit
import Domain

final class GameListCardView: UIView {
    
    // MARK: - Private Properties
    
    private var game: GameViewModel!
    
    // MARK: Outlets
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    
    // MARK: - Public Methods
    
    convenience init(game: GameViewModel) {
        self.init(frame: .zero)
        self.game = game
        Bundle.main.loadNibNamed("GameListCardView",
                                 owner: self,
                                 options: nil)
        pinning(containerView)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        setup()
    }
    
    // MARK - Private Methods
    
    private func setup() {
        coverImage.load(from: game.coverURL)
        coverImage.layer.cornerRadius = 12
        coverImage.layer.masksToBounds = true
        
        nameLabel.text = game.name
        rateLabel.text = game.rateDescription
    }
    
}
