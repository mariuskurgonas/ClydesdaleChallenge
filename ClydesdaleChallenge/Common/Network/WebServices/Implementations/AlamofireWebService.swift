//
//  AlamofireWebService.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 05/09/2018.
//  Copyright © 2018 Marius Kurgonas. All rights reserved.
//

import Alamofire
import Foundation

class AlamofireService {
    init(context: ApiContext) {
        self.context = context
    }

    var context: ApiContext

    func get(at route: ApiRoute, params: Parameters? = [:]) -> DataRequest {
        return request(at: route,
                       method: .get,
                       params: params,
                       encoding: URLEncoding.default)
    }

    private func request(at route: ApiRoute, method: HTTPMethod, params: Parameters?, encoding: ParameterEncoding) -> DataRequest {
        let url = route.url(for: context.environment)
        return Alamofire.request(url,
                                 method: method,
                                 parameters: params,
                                 encoding: encoding,
                                 headers: defaultHeaders())
            .debugLog()
    }

    private func defaultHeaders() -> [String: String] {
        return [
            "Accept": "application/json"
        ]
    }
}
