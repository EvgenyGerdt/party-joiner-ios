//
//  AddToCartRequestBody.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 03.12.2021.
//

import Foundation

struct AddToCartRequestBody: Codable {
    let price: Int
    let name: String
}
