//
//  CreatePartyRequestBody.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 30.11.2021.
//

import Foundation

struct CreatePartyRequestBody: Codable {
    let name: String
    let user: String
    let location: String
    let description: String
    let willHappenAt: Date
}
