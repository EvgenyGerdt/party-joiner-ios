//
//  User.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import Foundation

struct User: Decodable {
    var id: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
    }
    
    static var placeholder: Self {
        return User(id: nil, firstName: nil, lastName: nil, email: nil)
    }
}
