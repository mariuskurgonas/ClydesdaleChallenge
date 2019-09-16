//
//  PeopleService.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

typealias PeopleServiceResult = (_ people: [Person]?, _ error: Error?) -> Void

protocol PeopleService: CancelableService {
    func requestPeopleList(with completion: @escaping PeopleServiceResult)
}
