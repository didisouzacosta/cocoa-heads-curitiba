//
//  GameDetailController.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import UIKit

final class GameDetailController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModel: GameDetailViewModel
    
    // MARK: Outlets
    
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Public Methods
    
    init(viewModel: GameDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameDetail()
    }
    
    // MARK: - Private Methods
    
    private func loadGameDetail() {
        viewModel.loadGameDetail { [weak self] game in
            self?.coverImage.load(from: game.coverURL)
            self?.nameLabel.text = game.name
            self?.rateLabel.text = game.rateDescription
            self?.descriptionLabel.text = game.description
        }
    }
    
    // MARK: Actions
    
    @IBAction private func close() {
        viewModel.close()
    }
    
}
