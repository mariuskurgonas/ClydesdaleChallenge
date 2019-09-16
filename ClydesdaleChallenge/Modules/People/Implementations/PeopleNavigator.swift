//
//  PeopleNavigator.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

class PeopleNavigator: PeopleNavigating {
    var splitViewController: UISplitViewController
    
    var detailViewController: PersonDetailViewController
    
    var navigationController: UINavigationController
    
    required init(detail: PersonDetailViewController, navigationController: UINavigationController, splitController: UISplitViewController) {
        detailViewController = detail
        splitViewController = splitController
        self.navigationController = navigationController
    }
    
    func showDetails(of person: Person) {
        detailViewController.person = person
        splitViewController.showDetailViewController(navigationController, sender: nil)
    }
}
