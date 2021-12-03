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
    @StateObject var createPartyViewModel: CreatePartyViewModel

    var body: some View {
        Section {
            if !loginViewModel.signedIn {
                AuthView()
                    .environmentObject(loginViewModel)
            } else if !profileViewModel.hasError {
                ProfileView()
                    .environmentObject(profileViewModel)
                    .environmentObject(loginViewModel)
                    .environmentObject(createPartyViewModel)
                    .onAppear(perform: {
                        profileViewModel.loadUser()
                        
                        if (profileViewModel.hasError) {
                            loginViewModel.logout()
                        }
                    })
            } else {
                VStack {
                    Image(systemName: "wifi.slash")
                        .font(.largeTitle)
                    VStack {
                        Text("Не получилось загрузить данные :(")
                            .padding()
                            .multilineTextAlignment(.center)
                        Text("Проверьте подключение к интернету и попробуйте снова")
                            .multilineTextAlignment(.center)
                    }.padding()
                    
                    if !profileViewModel.hasLoading {
                        Button(action: {profileViewModel.loadUser()}) {
                            Text("Обновить")
                        }
                    } else {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(2)
                    }
                }
            }
        }.onAppear {
            loginViewModel.signedIn = loginViewModel.isSignedIn
        }
    }
}
