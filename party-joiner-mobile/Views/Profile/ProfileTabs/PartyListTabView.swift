//
//  PartyListTab.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 27.11.2021.
//

import SwiftUI

struct PartyListTabView: View {
    
    @EnvironmentObject var partyListViewModel: PartyListViewModel
    
    @State var searchFieldValue: String = ""
    @State var isShowSearchField: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                if isShowSearchField {
                    Section(content: {
                        TextField("Поиск по названию вечеринки", text: $searchFieldValue)
                    })
                }
                
                if !partyListViewModel.hasLoading {
                    List(partyListViewModel.parties, id: \._id) { party in
                        NavigationLink(destination: PartyView(party: party)) {
                            VStack {
                                HStack {
                                    Text(party.name)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                HStack {
                                    Text(party.info.willHappenAt)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                        }
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1)
                }
                
            }.navigationTitle("Список")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    Button(action: {
                        withAnimation {
                            isShowSearchField.toggle()
                        }
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                })
        }
    }
}
