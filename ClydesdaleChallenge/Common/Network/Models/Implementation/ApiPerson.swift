//
//  ApiPerson.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiPerson: Person, Mappable {
    var avatar: String = ""
    
    var jobTitle: String = ""
    
    var phone: String = ""
    
    var favouriteColour: String = ""
    
    var email: String = ""
    
    var firstName: String = ""
    
    var lastName: String = ""
    
    public required init?(map: Map) {}
    
    func mapping(map: Map) {
        avatar <- map["avatar"]
        jobTitle <- map["jobTitle"]
        phone <- map["phone"]
        favouriteColour <- map["favouriteColor"]
        email <- map["email"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
    }
}

extension ApiPerson: CustomDebugStringConvertible {
    var debugDescription: String {
        return "ApiPerson - firstName: \(firstName)\nlastName: \(lastName)\nemail: \(email)\nfavouriteColour: \(favouriteColour)\nphone: \(phone)\njobTitle: \(jobTitle)\navatar: \(avatar)\n"
    }
}
