//
//  NonPersistentApiContext.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

class NonPersistentApiContext: ApiContext {
    init(environment: ApiEnvironment) {
        self.environment = environment
    }
    
    var environment: ApiEnvironment
}
