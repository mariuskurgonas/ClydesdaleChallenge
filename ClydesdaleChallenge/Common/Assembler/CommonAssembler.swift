//
//  CommonAssembler.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Swinject
import Foundation

class CommonAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(NonPersistentApiContext.self) { r in
            return NonPersistentApiContext(environment: .development)
        }
        container.register(PeopleAlamofireService.self) { r in
            guard let apiContext = r.resolve(NonPersistentApiContext.self) else {
                assert(false)
            }
            return PeopleAlamofireService(context: apiContext)
        }
        container.register(RoomsAlamofireService.self) { r in
            guard let apiContext = r.resolve(NonPersistentApiContext.self) else {
                assert(false)
            }
            return RoomsAlamofireService(context: apiContext)
        }
    }
}
