//
//  PartyMembersView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 01.12.2021.
//

import SwiftUI

struct PartyMembersView: View {
    
    @State var members: [Party.Member]
    
    var body: some View {
        NavigationView {
            Form {
                Text("Members")
            }
        }
    }
}
