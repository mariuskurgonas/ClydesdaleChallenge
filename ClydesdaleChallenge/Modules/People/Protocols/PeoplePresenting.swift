//
//  PeoplePresenting.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 14/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol PeoplePresenting {
    var peopleDataSource: PeopleDataSource? { get set }
    
    var navigator: PeopleNavigating? { get set }
    
    var view: PeopleViewing? { get set }
    
    var peopleService: PeopleService? { get set }
    
    func viewDidLoad()
        
    func didSelectItemAt(index: Int)
    
    func updateData()
}
