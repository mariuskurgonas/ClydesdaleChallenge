//
//  PeopleAssembler.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 14/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Swinject
import Foundation
import UIKit

class PeopleAssembler: Assembly {
    
    // Assemble all module dependencies using Swinject
    func assemble(container: Container) {
        container.register(PeopleView.self) { r in
            return PeopleView(nibName: "\(PeopleView.self)", bundle: nil)
            }.initCompleted { (r, view) in
                view.presenter = r.resolve(PeoplePresenter.self)
                view.peopleDataSource = r.resolve(PeopleDataSource.self)
        }
        
        container.register(PeoplePresenter.self) { r in
            let presenter = PeoplePresenter()
            presenter.view = r.resolve(PeopleView.self)
            presenter.peopleService = r.resolve(PeopleAlamofireService.self)
            presenter.peopleDataSource = r.resolve(PeopleDataSource.self)
            return presenter
        }
        
        container.register(PeopleNavigator.self) { (r: Resolver, split: UISplitViewController, navigation: UINavigationController) in
            guard let detailController = navigation.topViewController as? PersonDetailViewController else {
                assert(false)
            }
            return PeopleNavigator(detail: detailController, navigationController: navigation, splitController: split)
        }
        
        container.register(PeopleBuilder.self) { r in
            let builder = PeopleBuilder()
            builder.container = container
            return builder
        }
        
        container.register(PeopleDataSource.self) { r in
            return PeopleDataSource()
        }.inObjectScope(.container)
    }
}
