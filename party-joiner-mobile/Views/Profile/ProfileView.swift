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

    var body: some View {
        TabView {
            CreatePartyTabView()
                .tabItem {
                    Text("Создать")
                    Image(systemName: "plus.circle")
                }
            
            PartyListTabView()
                .tabItem {
                    Text("Мои вечеринки")
                    Image(systemName: "person.3")
                }
            
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
