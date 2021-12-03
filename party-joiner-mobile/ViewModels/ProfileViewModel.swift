//
//  ProfileViewModel.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 29.11.2021.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {

    @Published var user: User = User.placeholder
    @Published var hasLoading: Bool = true
    @Published var hasError: Bool = false

    func loadUser() {
        UserService().loadUser() { result in
            switch result {
                case .success(let user):
                    self.user = user
                    self.hasLoading = false
                    self.hasError = false
                case .failure(let error):
                    self.hasLoading = false
                    self.hasError = true
                    print(error.localizedDescription)
            }
        }
    }
}
