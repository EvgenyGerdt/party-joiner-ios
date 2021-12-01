//
//  SignUpView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject private var registerViewModel = RegisterViewModel()
    
    private var registerCandidate: RegisterRequestBody {
        RegisterRequestBody(email: registerViewModel.email, password: registerViewModel.password, firstName: registerViewModel.firstName, lastName: registerViewModel.lastName)
    }
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            RegisterTitleContent()
            Spacer()
            
            VStack {
                VStack {
                    FirstNameFieldContent(firstName: $registerViewModel.firstName)
                        .padding(.top)
                    LastNameFieldContent(lastName: $registerViewModel.lastName)
                        .padding(.top)
                    RegEmailFieldContent(email: $registerViewModel.email)
                        .padding(.top)
                    RegPasswordFieldContent(password: $registerViewModel.password)
                        .padding(.top)
                }
                VStack {
                    Button(action: {registerViewModel.register()}) {
                        RegisterButtonContent()
                    }
                }
            }
            
            Spacer()
        }.padding()
    }
}

struct RegisterTitleContent: View {
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Text("Присоединяйся!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text("Регистрация.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }
        }.padding()
    }
}

struct FirstNameFieldContent: View {
    @Binding var firstName: String
    
    var body: some View {
        TextField("Введите свое имя...", text: $firstName)
            .padding()
            .background(.thickMaterial)
            .cornerRadius(10.0)
    }
}

struct LastNameFieldContent: View {
    @Binding var lastName: String
    
    var body: some View {
        TextField("Введите свою фамилию...", text: $lastName)
            .padding()
            .background(.thickMaterial)
            .cornerRadius(10.0)
    }
}

struct RegEmailFieldContent: View {
    @Binding var email: String
    
    var body: some View {
        TextField("Введите ваш почтовый адрес...", text: $email)
            .padding()
            .background(.thickMaterial)
            .cornerRadius(10.0)
    }
}

struct RegPasswordFieldContent: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Введите ваш пароль...", text: $password)
            .padding()
            .background(.thickMaterial)
            .cornerRadius(10.0)
    }
}

struct RegisterButtonContent: View {
    var body: some View {
        Text("SIGN UP")
            .font(.headline)
            .frame(width: 150, height: 50)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10.0)
            .padding()
    }
}
