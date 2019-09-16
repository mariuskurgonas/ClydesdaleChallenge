//
//  RoomsViewing.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol RoomsViewing: class {
    var roomsDataSource: RoomsDataSource? { get set }
    
    var presenter: RoomsPresenting? { get set }
    
    func showLoading()
}
