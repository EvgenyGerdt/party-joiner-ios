//
//  LoginResponse.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import Foundation

struct LoginResponse: Decodable {
    let user: User
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case user = "user"
        case token = "token"
    }
}
