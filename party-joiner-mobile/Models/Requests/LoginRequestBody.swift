//
//  LoginRequestBody.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import Foundation

struct LoginRequestBody: Codable {
    let email: String
    let password: String
}
