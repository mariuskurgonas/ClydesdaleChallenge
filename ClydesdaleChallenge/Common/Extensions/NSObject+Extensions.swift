//
//  NSObject+Extensions.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

extension NSObject {
    static func reuseIdentifier() -> String {
        return "\(self)"
    }
}
