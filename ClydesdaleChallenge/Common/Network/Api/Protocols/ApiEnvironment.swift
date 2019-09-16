//
//  ApiEnvironment.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 05/09/2018.
//  Copyright © 2018 Marius Kurgonas. All rights reserved.
//

import Foundation

enum ApiEnvironment: String { case

    development = "https://5cc736f4ae1431001472e333.mockapi.io/api/v1"

    var url: String {
        return rawValue
    }
}
