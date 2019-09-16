//
//  PeopleApiRoute.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

enum PeopleApiRoute: ApiRoute { case
    
    list
    
    var path: String {
        switch self {
        case .list: return "people"
        }
    }
    
    func url(for environment: ApiEnvironment) -> String {
        return "\(environment.url)/\(path)"
    }
}
