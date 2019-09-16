//
//  RoomsService.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

typealias RoomsServiceResult = (_ rooms: [Room]?, _ error: Error?) -> Void

protocol RoomsService: CancelableService {
    func requestRoomsList(with completion: @escaping RoomsServiceResult)
}
