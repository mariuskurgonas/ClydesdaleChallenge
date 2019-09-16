//
//  PeopleAlamofireService.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation

class PeopleAlamofireService: AlamofireService, PeopleService {
    func requestPeopleList(with completion: @escaping PeopleServiceResult) {
        request = get(at: PeopleApiRoute.list, params: nil)
            .responseArray(queue: .global(), keyPath: nil, context: nil) { (response: DataResponse<[ApiPerson]>) in
                
                DispatchQueue.main.async {
                    completion(response.value, response.error)
                }
        }
    }
    
    func cancel() {
        request?.cancel()
    }
    
    var request: Request?
}
