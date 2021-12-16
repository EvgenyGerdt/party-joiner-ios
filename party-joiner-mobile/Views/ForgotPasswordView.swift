//
//  ForgotPasswordView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject var forgotPasswordViewModel: ForgotPasswordViewModel = ForgotPasswordViewModel()
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            ResetPasswordTitleContent()
            Spacer()
            VStack {
                TextField("Введите почтовый адрес...", text: $forgotPasswordViewModel.email)
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(10.0)
                
                TextField("Введите 6-ти значный код", text: $forgotPasswordViewModel.code)
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(10.0)
                
                SecureField("Введите новый пароль", text: $forgotPasswordViewModel.password)
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(10.0)
                
                SecureField("Повторите новый пароль", text: $forgotPasswordViewModel.repeatedPassword)
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(10.0)
            }
            VStack {
                Button("Отправить") {
                    if !forgotPasswordViewModel.hasSended {
                        forgotPasswordViewModel.sendCode()
                    } else if forgotPasswordViewModel.hasSended && !forgotPasswordViewModel.hasChecked {
                        forgotPasswordViewModel.checkCode()
                    } else if forgotPasswordViewModel.hasSended && forgotPasswordViewModel.hasChecked {
                        forgotPasswordViewModel.changePassword()
                    }
                }
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

