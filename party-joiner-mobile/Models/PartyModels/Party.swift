//
//  Party.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 01.12.2021.
//

import Foundation

struct Party: Decodable {
    var _id: String
    var name: String
    var inviteCode: String
    var members: [Member]
    var info: Info
    var createdAt: String
    var __v: Int?
    
    struct Member: Decodable {
        struct CartItem: Decodable {
            var name: String
            var price: Int
        }
        
        var id: String
        var cart: [CartItem]
        var comeTo: String
        var status: String
        var role: String
    }
    
    struct Info: Decodable {
        var location: String
        var willHappenAt: String
        var description: String
    }
    
    enum CodingKeys: String, CodingKey {
        case _id = "_id"
        case name = "name"
        case inviteCode = "inviteCode"
        case members = "members"
        case info = "info"
        case createdAt = "createdAt"
        case __v = "__v"
    }
    
    static var placeholder: Self {
        return Party(_id: "", name: "", inviteCode: "",
                     members: [
                        Member(
                            id: "",
                            cart: [],
                            comeTo: "",
                            status: "",
                            role: ""
                        )
                     ],
                     info: Info(location: "", willHappenAt: "", description: ""), createdAt: "", __v: nil)
    }
}
