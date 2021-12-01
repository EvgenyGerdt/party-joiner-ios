//
//  MessageResponse.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 30.11.2021.
//

import Foundation

struct MessageResponse: Decodable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}
