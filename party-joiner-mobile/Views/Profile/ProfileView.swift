//
//  ProfileView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 25.11.2021.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var profileModel: ProfileViewModel
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var createPartyViewModel: CreatePartyViewModel
    @StateObject var partyListViewModel: PartyListViewModel = PartyListViewModel()

    var body: some View {
        TabView {
            CreatePartyTabView()
                .environmentObject(createPartyViewModel)
                .tabItem {
                    Text("Создать")
                    Image(systemName: "plus.circle")
                }
            
            PartyListTabView()
                .environmentObject(partyListViewModel)
                .tabItem {
                    Text("Мои вечеринки")
                    Image(systemName: "person.3")
                }.onAppear(perform: {
                    if loginViewModel.signedIn {
                        partyListViewModel.loadPartyList()
                    }
                })
            
            SettingsTabView()
                .environmentObject(loginViewModel)
                .environmentObject(profileModel)
                .tabItem {
                    Text("Настройки")
                    Image(systemName: "gear")
                }
        }
    }
}
