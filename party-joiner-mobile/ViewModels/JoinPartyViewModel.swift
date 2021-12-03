//
//  JoinPartyViewModel.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 03.12.2021.
//

import Foundation

class JoinPartyViewModel: ObservableObject {
    
    @Published var code: String = ""
    @Published var hasLoading: Bool = false
    @Published var hasError: Bool = false
    
    private var joinPartyBody: JoinPartyRequestBody {
        JoinPartyRequestBody(code: code)
    }
    
    func join() {
        self.hasLoading = true
        PartyService().joinToParty(joinPartyBody: joinPartyBody) { result in
            switch result {
            case .success(let message):
                print(message)
                self.hasLoading = false
                self.hasError = false
            case .failure(let error):
                print(error.localizedDescription)
                self.hasLoading = false
                self.hasError = true
            }
        }
    }
}
