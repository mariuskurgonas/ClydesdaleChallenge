//
//  PeopleView.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 14/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import UIKit

class PeopleView: UITableViewController, PeopleViewing {
    var peopleDataSource: PeopleDataSource?
    
    var presenter: PeoplePresenting?
    
    func showLoading() {
        refreshControl?.beginRefreshingManually()
    }
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "People list"
        
        // Configure Refresh Control
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(PeopleView.refreshData), for: .valueChanged)
        let attrs = [NSAttributedString.Key.foregroundColor : ThemeManager.currentTheme().mainColor ]
        refreshControl?.attributedTitle = NSAttributedString(string: "Fetching People Data ...", attributes: attrs)
        
        // Data source has to be set
        guard let dataSource = peopleDataSource else {
            assert(false)
            return
        }
        
        // Register menu cell type
        tableView.register(UINib(nibName: PersonTableViewCell.reuseIdentifier(), bundle: nil), forCellReuseIdentifier: PersonTableViewCell.reuseIdentifier())
        tableView.dataSource = dataSource
        dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.refreshControl?.endRefreshing()
            self?.tableView.reloadData()
        }
        tableView.refreshControl = refreshControl
        
        // Presenter must be set
        guard let presenter = presenter else {
            assert(false, "presenter not set")
            return
        }
        
        // Forward the event to presenter to handle
        presenter.viewDidLoad()
    }
    
    // MARK: PeopleView
    
    @objc private func refreshData() {
        // Presenter must be set
        guard let presenter = presenter else {
            assert(false, "presenter not set")
            return
        }
        
        // Forward the event to presenter to handle
        presenter.updateData()
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Forward the event to presenter
        presenter?.didSelectItemAt(index: indexPath.row)
    }
}
