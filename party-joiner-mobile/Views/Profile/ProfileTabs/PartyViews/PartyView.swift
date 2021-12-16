//
//  PartyView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 01.12.2021.
//

import SwiftUI

struct PartyView: View {
    
    @StateObject var partyViewModel: PartyViewModel = PartyViewModel()
    @State var isShowShareSheet: Bool = false
    
    @State var partyId: String
    
    var id = UserDefaults.standard.string(forKey: "id")
    
    var currentMember: Party.Member? {
        if partyViewModel.loaded {
            return partyViewModel.party.members.filter { $0.id == self.id ?? "" }[0]
        } else {
            return nil
        }
    }
    
    var memberCart: [Party.Member.CartItem] {
        if partyViewModel.loaded {
            return currentMember?.cart ?? []
        } else {
            return []
        }
    }
    
    var body: some View {
            Form {
                Section(content: {
                    Button(action: {isShowShareSheet.toggle()}) {
                        HStack {
                            Text(partyViewModel.party.inviteCode)
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
                    HStack {
                        Image(systemName: "ellipsis.bubble")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                        Text(partyViewModel.party.info.description)
                    }
                    HStack {
                        Image(systemName: "location")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                        Text(partyViewModel.party.info.location)
                    }
                }, header: {
                    Text("Описание")
                })
                
                Section(content: {
                    NavigationLink(destination:
                                    MemberCartView(cart: memberCart, partyId: partyId)
                                    .environmentObject(partyViewModel)) {
                        Image(systemName: "dollarsign.square.fill")
                            .renderingMode(.original)
                            .foregroundColor(.yellow)
                            .font(.system(size: 26))
                        Text("Мои товары")
                    }
                    
                    NavigationLink(destination: PartyMembersView(members: partyViewModel.party.members)) {
                        Image(systemName: "m.square.fill")
                            .renderingMode(.original)
                            .foregroundColor(.green)
                            .font(.system(size: 26))
                        Text("Участники")
                    }
                })
                
                if currentMember?.role == MemberStatus.CREATOR {
                    Section(content: {
                        Button(action: {print("close")}) {
                            HStack {
                                Spacer()
                                Text("Закрыть")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }, footer: {
                        Text("Можно закрыть вечеринку, если она закончилась или отменилась")
                    })
                }
            }
            .refreshable {partyViewModel.loadParty(id: partyId)}
            .onAppear(perform: {partyViewModel.loadParty(id: partyId)})
            .navigationTitle(partyViewModel.party.name)
                .navigationBarTitleDisplayMode(.inline)
                .sheet(isPresented: $isShowShareSheet, onDismiss: {partyViewModel.loadParty(id: partyId)}) {
                ShareSheet(activityItems: [partyViewModel.party.inviteCode])
            }
    }
}
