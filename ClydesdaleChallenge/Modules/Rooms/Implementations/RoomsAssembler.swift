//
//  RoomsAssembler.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Swinject
import Foundation
import UIKit

class RoomsAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(RoomsCollectionView.self) { r in
            return RoomsCollectionView(nibName: "\(RoomsCollectionView.self)", bundle: nil)
            }.initCompleted { (r, view) in
                view.presenter = r.resolve(RoomsPresenter.self)
                view.roomsDataSource = r.resolve(RoomsDataSource.self)
        }
        
        container.register(RoomsPresenter.self) { r in
            let presenter = RoomsPresenter()
            presenter.view = r.resolve(RoomsCollectionView.self)
            presenter.roomsService = r.resolve(RoomsAlamofireService.self)
            presenter.dataSource = r.resolve(RoomsDataSource.self)
            return presenter
        }
        
        container.register(RoomsDataSource.self) { r in
            return RoomsDataSource()
        }.inObjectScope(.container)
    }
}
