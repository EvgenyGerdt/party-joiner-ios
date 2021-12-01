//
//  PartyView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 01.12.2021.
//

import SwiftUI

struct PartyView: View {
    
    @State var party: Party
    @State var isShowShareSheet: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(content: {
                    Button(action: {isShowShareSheet.toggle()}) {
                        HStack {
                            Text(party.inviteCode)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                }, header: {
                    Text("Код для вступления")
                })
                
                Section(content: {
                    Text(party.info.description)
                }, header: {
                    Text("Описание")
                })
                
                Section(content: {
                    NavigationLink(destination: MemberCartView(cart: partyViewModel.memberCart)) {
                        Image(systemName: "dollarsign.square.fill")
                        Text("Мои товары")
                    }
                })
            }
        }.navigationTitle(party.name)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isShowShareSheet) {
                ShareSheet(activityItems: [party.inviteCode])
            }
    }
}
