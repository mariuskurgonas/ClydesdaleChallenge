//
//  RoomsPresenter.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

class RoomsPresenter: RoomsPresenting {
    var dataSource: RoomsDataSource?
    
    var roomsService: RoomsService?
    
    weak var view: RoomsViewing?
    
    func viewDidLoad() {
        view?.showLoading()
        updateData()
    }
    
    func updateData() {
        // Data source has to be set
        guard let dataSource = dataSource else {
            assert(false)
            return
        }
        
        roomsService?.cancel()
        roomsService?.requestRoomsList(with: { (rooms, error) in
            if let rooms = rooms {
                let sortedRooms = rooms.sorted(by: { (r1, r2) -> Bool in
                    return r1.name < r2.name
                })
                dataSource.data.value = sortedRooms
            }
            else {
                // TODO: HANDLE ERROR AND SHOW MESSAGE
            }
        })
    }
}
