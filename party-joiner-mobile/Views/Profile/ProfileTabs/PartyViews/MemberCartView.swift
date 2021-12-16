//
//  MemberCartView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 01.12.2021.
//

import SwiftUI

struct MemberCartView: View {
    
    @EnvironmentObject var partyViewModel: PartyViewModel
    
    @State var cart: [Party.Member.CartItem]
    @State var isShowAddToCartSheet: Bool = false
    
    @State var partyId: String
    
    var body: some View {
        Form {
            List(cart, id: \.price) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text("Цена: \(item.price) Р.")
                        .frame(width: 100, alignment: .leading)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }.navigationTitle("Мои товары")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Button(action: {isShowAddToCartSheet.toggle()}) {
                    Image(systemName: "plus")
                }.sheet(isPresented: $isShowAddToCartSheet, content: {
                    AddToCartSheet(partyId: partyId)
                        .onDisappear(perform: {partyViewModel.loadParty(id: partyId)})
                })
            })
    }
}
