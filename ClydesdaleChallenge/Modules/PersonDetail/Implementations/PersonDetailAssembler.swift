//
//  PersonDetailAssembler.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Swinject
import Foundation
import UIKit

class PersonDetailAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(PersonDetailViewController.self) { r in
            return PersonDetailViewController(nibName: "\(PersonDetailViewController.self)", bundle: nil)
        }
    }
}

