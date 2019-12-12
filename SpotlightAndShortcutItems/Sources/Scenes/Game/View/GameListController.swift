//
//  GameListController.swift
//  SpotlightAndShortcutItems
//
//  Created by Adriano Souza Costa on 10/12/19.
//  Copyright © 2019 CocoaHeadsCuritiba. All rights reserved.
//

import Foundation
import UIKit

final class GameListController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModel: GameListViewModel
    
    // MARK: Outlets
    
    @IBOutlet private weak var sliderContainerView: UIView!
    
    // MARK: - Public Methods
    
    init(viewModel: GameListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    // MARK: - Private Methods
    
    private func loadData() {
        viewModel.loadGames { [weak self] in
            self?.setupSlider()
        }
    }
    
    private func setupSlider() {
        let cards = viewModel.games.map { game -> GameListCardView in
            return GameListCardView(game: game)
        }
        let space: CGFloat = 16
        let slider = PageSlider(pages: cards,
                                padding: space,
                                spacing: space)
        slider.didSelectHandler = { [weak self] index in
            guard let self = self else { return }
            self.viewModel.didSelect(game: self.viewModel.games[index])
        }
        
        sliderContainerView.pinning(slider)
    }
    
}
