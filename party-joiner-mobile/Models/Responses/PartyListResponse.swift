//
//  PartyListResponse.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 01.12.2021.
//

import Foundation

struct PartyListResponse: Decodable {
    var parties: [Party]?
}
