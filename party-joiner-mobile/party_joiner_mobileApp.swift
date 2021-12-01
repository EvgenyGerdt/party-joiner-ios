//
//  party_joiner_mobileApp.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import SwiftUI

@main
struct party_joiner_mobileApp: App {
    var body: some Scene {
        WindowGroup {
            PartyJoinerView(loginViewModel: LoginViewModel(), profileViewModel: ProfileViewModel(), createPartyViewModel: CreatePartyViewModel(), partyListViewModel: PartyListViewModel())
                .environment(\.locale, .init(identifier: "en"))
        }
    }
}
