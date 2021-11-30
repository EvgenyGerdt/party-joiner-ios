//
//  ContentView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import SwiftUI

struct PartyJoinerView: View {
    
    @StateObject var loginViewModel: LoginViewModel
    @StateObject var profileViewModel: ProfileViewModel

    var body: some View {
        Section {
            if !loginViewModel.signedIn {
                AuthView()
                    .environmentObject(loginViewModel)
            } else {
                ProfileView()
                    .environmentObject(profileViewModel)
                    .environmentObject(loginViewModel)
                    .onAppear(perform: {profileViewModel.loadUser()})
            }
        }.onAppear {
            loginViewModel.signedIn = loginViewModel.isSignedIn
        }
    }
}
