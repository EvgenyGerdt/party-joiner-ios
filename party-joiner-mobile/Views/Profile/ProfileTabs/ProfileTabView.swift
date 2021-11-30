//
//  ProfileTab.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 27.11.2021.
//

import SwiftUI

struct ProfileTabView: View {
    
    @EnvironmentObject var profileModel: ProfileViewModel
    
    var username: String {
        return profileModel.user.firstName != nil && profileModel.user.lastName != nil ? "\(profileModel.user.firstName!) \(profileModel.user.lastName!)" : ""
    }
    
    var email: String {
        return profileModel.user.email != nil ? "\(profileModel.user.email!)" : ""
    }
    
    var body: some View {
        VStack {
            HStack {
                UserInfoView(username: username)
            }
            Spacer()
        }.padding()
    }
}

struct UserInfoView: View {
    var username: String = ""
    var email: String = ""
    
    var body: some View {
        VStack {
            Text("Evgeny Gerdt")
                .font(.title)
                .fontWeight(.bold)
            
            Text("assmys041298@gmail.com")
                .foregroundColor(.gray)
        }.padding()
    }
}
