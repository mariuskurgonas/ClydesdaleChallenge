//
//  RoomsCollectionView.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import UIKit

class RoomsCollectionView: UICollectionViewController, RoomsViewing {
    var presenter: RoomsPresenting?
    
    var roomsDataSource: RoomsDataSource?
    
    var customLayout = AdaptiveFlowLayout()
    
    private let refreshControl = UIRefreshControl()
    
    func showLoading() {
        refreshControl.beginRefreshingManually()
    }
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Rooms list"
        
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(RoomsCollectionView.refreshData), for: .valueChanged)
        collectionView.addSubview(refreshControl)
        collectionView.alwaysBounceVertical = true
        let attrs = [NSAttributedString.Key.foregroundColor : ThemeManager.currentTheme().mainColor ]
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Rooms Data ...", attributes: attrs)
        
        // Register cell class
        self.collectionView!.register(UINib(nibName: RoomCollectionViewCell.reuseIdentifier(), bundle: nil), forCellWithReuseIdentifier: RoomCollectionViewCell.reuseIdentifier())
        
        // Data source has to be set
        guard let dataSource = roomsDataSource else {
            assert(false)
            return
        }
        
        collectionView.dataSource = dataSource
        collectionView.collectionViewLayout = customLayout
        dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.refreshControl.endRefreshing()
            self?.collectionView.reloadData()
        }
        
        // Presenter is mandatory
        guard let presenter = presenter else {
            assert(false)
        }
        
        // Forward event to presenter
        presenter.viewDidLoad()
    }
    
    // MARK: RoomsCollectionView
    
    @objc private func refreshData() {
        // Presenter is mandatory
        guard let presenter = presenter else {
            assert(false)
        }
        
        // Forward event to presenter
        presenter.updateData()
    }
    
    // MARK: Collection view layout support
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.reloadCollectionViewLayout(self.view.bounds.size.width)
    }
    
    // Reload layout with the current width of the screen
    private func reloadCollectionViewLayout(_ width: CGFloat) {
        self.customLayout.containerWidth = width
        self.customLayout.display = self.view.traitCollection.horizontalSizeClass == .compact && self.view.traitCollection.verticalSizeClass == .regular ? CollectionDisplay.list : CollectionDisplay.grid(columns: 4)
    }
}
