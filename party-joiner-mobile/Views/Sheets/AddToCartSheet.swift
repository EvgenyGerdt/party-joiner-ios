//
//  AddToCartSheet.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 03.12.2021.
//

import SwiftUI

struct AddToCartSheet: View {
    
    @StateObject var cartViewModel: CartViewModel = CartViewModel()
    @State var partyId: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(content: {
                    TextField("Название товара", text: $cartViewModel.name)
                    TextField("Цена", text: Binding(
                        get: { String(cartViewModel.price) },
                        set: { cartViewModel.price = Int($0) ?? 0 }
                    ))
                        .keyboardType(.numberPad)
                }, header: {
                    Text("Добавьте товар в корзину")
                })
                Button(action: {cartViewModel.addItemToCart(id: partyId)}) {
                    HStack {
                        Spacer()
                        Text("Добавить")
                        Spacer()
                    }
                }
            }.toolbar(content: {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.gray)
                })
            })
        }
    }
}
