//
//  LoginViewModel.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""

    var isSignedIn: Bool {
        return UserDefaults.standard.string(forKey: "token") != nil
    }
    
    @Published var hasAuthError: Bool = false
    @Published var signedIn: Bool = false
    
    private var loginCandidate: LoginRequestBody {
        LoginRequestBody(email: email, password: password)
    }
        
    func login() {
        AuthService().login(user: loginCandidate) { result in
            switch result {
                case .success(let response):
                    UserDefaults.standard.set(response.token, forKey: "token")
                    UserDefaults.standard.set(response.user.id, forKey: "id")
                    UserDefaults.standard.synchronize()
                
                    self.signedIn = self.isSignedIn
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.synchronize()
        
        self.signedIn = self.isSignedIn
    }
}
