//
//  CartViewModel.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 03.12.2021.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var price: Int = 0
    @Published var name: String = ""
    
    @Published var hasLoading: Bool = false
    @Published var hasError: Bool = false
    
    private var addItemToCartBody: AddToCartRequestBody {
        AddToCartRequestBody(price: price, name: name)
    }
    
    func addItemToCart() {
        self.hasLoading = true
        PartyService().addItemToCart(addItemToCartBody: addItemToCartBody) { result in
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
