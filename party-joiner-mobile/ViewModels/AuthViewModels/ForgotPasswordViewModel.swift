//
//  ForgotPasswordViewModel.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 05.12.2021.
//

import Foundation

class ForgotPasswordViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var code: String = ""
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    
    @Published var hasSended: Bool = false
    @Published var hasChecked: Bool = false
    @Published var hasChanged: Bool = false
    
    func sendCode() {
        
    }
    
    func checkCode() {
        
    }
    
    func changePassword() {
        
    }
}
