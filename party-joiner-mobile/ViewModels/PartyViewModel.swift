//
//  PartyViewModel.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 01.12.2021.
//

import Foundation

class PartyViewModel: ObservableObject {
    
    @Published var party: Party = Party.placeholder
    var id = UserDefaults.standard.string(forKey: "id")
    
    var currentMember: Party.Member {
        return party.members.filter { $0.id == self.id ?? "" }[0]
    }
    
    var memberCart: [Party.Member.CartItem] {
        return currentMember.cart
    }
    
    init(party: Party) {
        self.party = party
    }
}
