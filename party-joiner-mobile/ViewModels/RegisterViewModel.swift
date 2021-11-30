//
//  RegisterViewModel.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    var firstName: String = ""
    var lastName: String = ""
    
    @Published var hasAuthError: Bool = false
    
    private var registerCandidate: RegisterRequestBody {
        RegisterRequestBody(email: email, password: password, firstName: firstName, lastName: lastName)
    }
    
    func register() {
        AuthService().register(user: registerCandidate) { result in
            switch result {
                case .success(let message):
                    print(message)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
