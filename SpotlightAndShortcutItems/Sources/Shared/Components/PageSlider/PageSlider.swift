//
//  PageSlider.swift
//  Common
//
//  Created by Adriano Souza Costa on 12/04/19.
//  Copyright © 2019 Consulta Remedios. All rights reserved.
//

import UIKit
import MSPeekCollectionViewDelegateImplementation

public class PageSlider: UIView {
     
    // MARK: - Public Variables
    
    public var didSelectHandler: ((_ index: Int) -> Void)?
    public var currentPageChangedHandler: ((_ index: Int) -> Void)?
    
    public var currentPage: Int {
        return Int(ceil(collectionView.contentOffset.x / collectionView.frame.size.width))
    }
    
    public var pagesCount: Int {
        return pages.count
    }
    
    // MARK: - Private Variables
    
    private var pages: [UIView] = []
    private var peekImplementation: MSPeekCollectionViewDelegateImplementation!
    private var padding: CGFloat = 0.0
    private var spacing: CGFloat = 0.0
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: frame,
                                              collectionViewLayout: UICollectionViewFlowLayout())
        
        peekImplementation = MSPeekCollectionViewDelegateImplementation(cellSpacing: spacing,
                                                                        cellPeekWidth: padding,
                                                                        scrollThreshold: 100)
        peekImplementation.delegate = self
        collectionView.configureForPeekingDelegate()
        collectionView.delegate = peekImplementation
        collectionView.dataSource = self
        
        collectionView.register(PageSliderViewCell.self,
                                forCellWithReuseIdentifier: PageSliderViewCell.reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    // MARK: - Public Methods
    
    public init(frame: CGRect = .zero,
                pages: [UIView],
                padding: CGFloat = 0.0,
                spacing: CGFloat = 0.0) {
        super.init(frame: frame)
        self.pages = pages
        self.padding = padding
        self.spacing = spacing
    }
    
    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func reloadData() {
        collectionView.reloadData()
    }
    
    // MARK: - Private Methods
    
    private func setupCollectionView() {
        pinning(collectionView)
    }
    
}

extension PageSlider: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageSliderViewCell.reuseIdentifier,
                                                            for: indexPath) as? PageSliderViewCell else { fatalError() }
        cell.setup(with: pages[indexPath.row])
        return cell
    }
    
}

extension PageSlider: MSPeekImplementationDelegate {
    
    public func peekImplementation(_ peekImplementation: MSPeekCollectionViewDelegateImplementation,
                                   didChangeActiveIndexTo activeIndex: Int) {
        currentPageChangedHandler?(activeIndex)
    }
    
    public func peekImplementation(_ peekImplementation: MSPeekCollectionViewDelegateImplementation,
                                   didSelectItemAt indexPath: IndexPath) {
        didSelectHandler?(indexPath.row)
    }
    
}
