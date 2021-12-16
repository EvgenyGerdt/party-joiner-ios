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
            if !partyListViewModel.hasError {
                Form {
                    if isShowSearchField {
                        Section(content: {
                            TextField("Поиск по названию вечеринки", text: $partyListViewModel.searchInput)
                        })
                    }
                    List(partyListViewModel.hasSearching ?
                         partyListViewModel.filteredParties : partyListViewModel.parties, id: \._id) { party in
                        NavigationLink(destination: PartyView(partyId: party._id)) {
                            VStack {
                                HStack {
                                    Text(party.name)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                HStack {
                                    Text(partyListViewModel.formattedDate(dateStr: party.info.willHappenAt), style: .date)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }.padding()
                        }
                    }
                }
                .refreshable {
                    partyListViewModel.loadPartyList()
                }
                .navigationTitle("Список")
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
                                Image(systemName: "person.badge.plus")
                            }.sheet(isPresented: $isShowJoinPartySheet, onDismiss: {partyListViewModel.loadPartyList()}, content: {
                                JoinPartySheet()
                            })
                        })
                    })
            } else {
                VStack {
                    Text("😔")
                        .font(.system(size: 50))
                        .padding()
                    Text("Произошла ошибка")
                    Button("Обновить") {
                        partyListViewModel.loadPartyList()
                    }.padding()
                }
            }
        }
    }
}
