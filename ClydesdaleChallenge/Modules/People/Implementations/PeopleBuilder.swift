//
//  PeopleBuilder.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class PeopleBuilder {
    var container: Container?
    
    func build(split: UISplitViewController, navigation: UINavigationController) -> PeopleView? {
        let peopleView = container?.resolve(PeopleView.self)
        peopleView?.presenter?.navigator = container?.resolve(PeopleNavigator.self, arguments: split, navigation)
        return peopleView
    }
}
