//
//  PeopleViewing.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 14/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol PeopleViewing: class {
    var peopleDataSource: PeopleDataSource? { get set }
    
    var presenter: PeoplePresenting? { get set }
    
    func showLoading()
}
