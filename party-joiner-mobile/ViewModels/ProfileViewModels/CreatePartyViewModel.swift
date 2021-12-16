//
//  CreatePartyViewModel.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 30.11.2021.
//

import Foundation

class CreatePartyViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var location: String = ""
    @Published var willHappenAt: Date = Date.now
    
    @Published var hasLoading: Bool = false
    @Published var hasError: Bool = false
    
    private var party: CreatePartyRequestBody {
        CreatePartyRequestBody(name: name, user: UserDefaults.standard.string(forKey: "id")!, location: location, description: description, willHappenAt: willHappenAt)
    }
    
    func createParty() {
        self.hasLoading = true
        PartyService().createParty(party: party) { result in
            switch result {
            case .success(let message):
                print(message)
                self.hasLoading = false
            case .failure(let error):
                self.hasError = true
                self.hasLoading = false
                print(error.localizedDescription)
            }
        }
    }
}
