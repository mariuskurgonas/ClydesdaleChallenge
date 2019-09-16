//
//  ApiRoom.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiRoom: Room, Mappable {
    var name: String = ""
    
    var isOccupied: Bool = false
    
    public required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        isOccupied <- map["isOccupied"]
    }
}
