//
//  PartyListViewModel.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 01.12.2021.
//

import Foundation

class PartyListViewModel: ObservableObject {
    
    @Published var parties: [Party] = [Party.placeholder]
    
    @Published var searchInput: String = ""
    
    @Published var hasLoading: Bool = false
    @Published var hasError: Bool = false
    
    var hasSearching: Bool {
        return searchInput.count > 0
    }
    
    var filteredParties: [Party] {
        return parties.filter { $0.name.contains(searchInput) }
    }
    
    func loadPartyList() {
        self.hasLoading = true
        PartyService().loadPartyList() { result in
            switch result {
            case .success(let parties):
                self.parties = parties
                self.hasLoading = false
            case .failure(let error):
                self.hasLoading = false
                self.hasError = true
                print(error.localizedDescription)
            }
        }
    }
}
