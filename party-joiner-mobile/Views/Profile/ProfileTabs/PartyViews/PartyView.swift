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
    
    var id = UserDefaults.standard.string(forKey: "id")
    
    var currentMember: Party.Member {
        return party.members.filter { $0.id == self.id ?? "" }[0]
    }
    
    var memberCart: [Party.Member.CartItem] {
        return currentMember.cart
    }
    
    var body: some View {
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
                    NavigationLink(destination: MemberCartView(cart: memberCart)) {
                        Image(systemName: "dollarsign.square.fill")
                            .renderingMode(.original)
                            .foregroundColor(.yellow)
                            .font(.system(size: 26))
                        Text("Мои товары")
                    }
                    
                    NavigationLink(destination: PartyMembersView(members: party.members)) {
                        Image(systemName: "m.square.fill")
                            .renderingMode(.original)
                            .foregroundColor(.green)
                            .font(.system(size: 26))
                        Text("Участники")
                    }
                })
                
                if currentMember.role == MemberStatus.CREATOR {
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
            .navigationTitle(party.name)
                .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isShowShareSheet) {
                ShareSheet(activityItems: [party.inviteCode])
            }
    }
}
