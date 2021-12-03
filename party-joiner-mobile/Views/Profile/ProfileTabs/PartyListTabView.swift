//
//  PartyListTab.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 27.11.2021.
//

import SwiftUI

struct PartyListTabView: View {
    
    @EnvironmentObject var partyListViewModel: PartyListViewModel
    
    @State var isShowSearchField: Bool = false
    @State var isShowJoinPartySheet: Bool = false
    
    var dateFormatter = DateFormatter()
    
    var body: some View {
        NavigationView {
            Form {
                if isShowSearchField {
                    Section(content: {
                        TextField("Поиск по названию вечеринки", text: $partyListViewModel.searchInput)
                    })
                }
                
                if !partyListViewModel.hasLoading {
                    List(partyListViewModel.hasSearching ?
                         partyListViewModel.filteredParties : partyListViewModel.parties, id: \._id) { party in
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
                            }.padding()
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
                    ToolbarItem(placement: .primaryAction, content: {
                        Button(action: {
                            withAnimation {
                                isShowSearchField.toggle()
                            }
                        }) {
                            Image(systemName: "magnifyingglass")
                        }
                    })
                    
                    ToolbarItem(placement: .navigation, content: {
                        Button(action: {
                            withAnimation {
                                isShowJoinPartySheet.toggle()
                            }
                        }) {
                            Image(systemName: "plus")
                        }.sheet(isPresented: $isShowJoinPartySheet, content: {
                            JoinPartySheet()
                        })
                    })
                })
        }
    }
}
