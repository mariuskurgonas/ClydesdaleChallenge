//
//  Person.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol Person {
    // Assume all fields mandatory
    var avatar: String { get }
    var jobTitle: String { get }
    var phone: String { get }
    var favouriteColour: String { get }
    var email: String { get }
    var firstName: String { get }
    var lastName: String { get }
}
