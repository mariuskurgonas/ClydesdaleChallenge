//
//  PeopleNavigating.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

protocol PeopleNavigating {
    init(detail: PersonDetailViewController, navigationController: UINavigationController, splitController: UISplitViewController)
    
    func showDetails(of person: Person)
}
