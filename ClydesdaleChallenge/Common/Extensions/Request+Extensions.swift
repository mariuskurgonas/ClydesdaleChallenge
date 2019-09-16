//
//  Request+Extensions.swift
//  ClydesdaceChallenge
//
//  Created by Marius Kurgonas on 06/09/2018.
//  Copyright © 2018 Marius Kurgonas. All rights reserved.
//

import Alamofire
import Foundation

extension Request {
    func debugLog() -> Self {
        debugPrint("\(self)")
        return self
    }
}
