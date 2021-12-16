//
//  PartyViewModel.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 03.12.2021.
//

import Foundation

class PartyViewModel: ObservableObject {
    
    @Published var party: Party = Party.placeholder
    
    @Published var hasLoading: Bool = false
    @Published var loaded: Bool = false
    @Published var hasError: Bool = false
    
    func loadParty(id: String) {
        self.hasLoading = true
        PartyService().loadCurrentParty(id: id) { result in
            switch result {
            case .success(let party):
                self.party = party
                self.loaded = true
                self.hasLoading = false
                self.hasError = false
            case .failure(let error):
                print(error.localizedDescription)
                self.loaded = false
                self.hasError = true
                self.hasLoading = false
            }
        }
    }
}
