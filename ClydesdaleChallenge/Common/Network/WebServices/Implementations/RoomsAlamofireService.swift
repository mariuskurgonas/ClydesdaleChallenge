//
//  RoomsAlamofireService.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation

class RoomsAlamofireService: AlamofireService, RoomsService {
    func requestRoomsList(with completion: @escaping RoomsServiceResult) {
        request = get(at: RoomsApiRoute.list, params: nil)
            .responseArray(queue: .global(), keyPath: nil, context: nil) { (response: DataResponse<[ApiRoom]>) in
                            
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
