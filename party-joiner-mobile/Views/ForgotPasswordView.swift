//
//  ForgotPasswordView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import SwiftUI

struct ForgotPasswordView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            ResetPasswordTitleContent()
            Spacer()
            VStack {
                
            }
        }.padding()
    }
}

struct ResetPasswordTitleContent: View {
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Text("Восстановить пароль")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text("Это легко :)")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }
        }.padding()
    }
}

