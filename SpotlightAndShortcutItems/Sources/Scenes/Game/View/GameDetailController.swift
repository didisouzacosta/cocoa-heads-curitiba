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
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        coverImage.load(from: viewModel.coverURL)
        nameLabel.text = viewModel.name
        rateLabel.text = viewModel.rateDescription
        descriptionLabel.text = viewModel.description
    }
    
    // MARK: Actions
    
    @IBAction private func close() {
        viewModel.close()
    }
    
}
