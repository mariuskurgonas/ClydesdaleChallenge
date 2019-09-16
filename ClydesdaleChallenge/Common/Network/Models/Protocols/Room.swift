//
//  Room.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol Room {
    // Assume all fields mandatory
    var name: String { get set }
    var isOccupied: Bool { get set }
}
