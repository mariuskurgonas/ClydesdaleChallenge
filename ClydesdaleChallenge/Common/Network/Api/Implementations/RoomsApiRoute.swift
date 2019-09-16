//
//  RoomsApiRoute.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

enum RoomsApiRoute: ApiRoute { case
    
    list
    
    var path: String {
        switch self {
        case .list: return "rooms"
        }
    }
    
    func url(for environment: ApiEnvironment) -> String {
        return "\(environment.url)/\(path)"
    }
}
