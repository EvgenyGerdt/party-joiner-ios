//
//  WelcomeView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 25.11.2021.
//

import SwiftUI

struct AuthView: View {
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 20)
                WelcomeContent()
                Spacer()
                VStack {
                    EmailFieldContent(email: $loginViewModel.email)
                        .padding(.top)
                    PasswordFieldContent(password: $loginViewModel.password)
                        .padding(.top)
                }
                VStack {
                    ForgotPasswordContent(hasAuthError: $loginViewModel.hasAuthError)
                    NavigationLink(destination: ProfileView()) {
                        Button(action: {loginViewModel.login()}) {
                            LoginButtonContent(hasLoading: $loginViewModel.hasLoading)
                        }
                    }
                }
                Spacer()
                SignUpContent()
            }.padding()
        }
    }
}

struct LoginButtonContent: View {
    
    @Binding var hasLoading: Bool
    
    var body: some View {
        if !hasLoading {
            Text("Войти")
                .font(.headline)
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10.0)
                .padding()
        } else {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1)
        }
    }
}

struct WelcomeContent: View {
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Text(LocalizedStringKey("С возращением!"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text("Войдите в аккаунт.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }
        }.padding()
    }
}

struct ForgotPasswordContent: View {
    @Binding var hasAuthError: Bool
    
    var body: some View {
        HStack {
            if(hasAuthError) {
                Text("Invalid credentials, try again.")
                    .foregroundColor(.red)
            }
            Spacer()
            NavigationLink(destination: ForgotPasswordView(), label: {
                Text("Забыли пароль?")
            })
                .foregroundColor(.blue)
        }
    }
}

struct EmailFieldContent: View {
    @Binding var email: String
    
    var body: some View {
        TextField("Почта", text: $email)
            .padding()
            .background(.thickMaterial)
            .cornerRadius(10.0)
    }
}

struct PasswordFieldContent: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Пароль", text: $password)
            .padding()
            .background(.thickMaterial)
            .cornerRadius(10.0)
    }
}

struct SignUpContent: View {
    var body: some View {
        HStack {
            Text(LocalizedStringKey("Нет аккаунта?"))
            NavigationLink(destination: SignUpView(), label: {
                Text(LocalizedStringKey("Создать!"))
            })
                .foregroundColor(.blue)
        }
    }
}
