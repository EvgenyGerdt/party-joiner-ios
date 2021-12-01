//
//  MemberCartView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 01.12.2021.
//

import SwiftUI

struct MemberCartView: View {
    
    @State var cart: [Party.Member.CartItem]
    
    var body: some View {
        NavigationView {
            Form {
                Section(content: {
                    Text("Cart")
                })
            }.navigationTitle("Мои товары")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    Button(action: {print("add")}) {
                        Image(systemName: "plus")
                    }
                })
        }
    }
}
