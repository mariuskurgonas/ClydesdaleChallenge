//
//  RoomsPresenting.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol RoomsPresenting {
    var dataSource: RoomsDataSource? { get set }
    
    var roomsService: RoomsService? { get set }
    
    var view: RoomsViewing? { get set }
    
    func viewDidLoad()
    
    func updateData()
}
