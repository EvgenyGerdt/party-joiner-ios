//
//  JoinPartyView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 03.12.2021.
//

import SwiftUI

struct JoinPartySheet: View {
    
    @StateObject var joinPartyViewModel: JoinPartyViewModel = JoinPartyViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section(content: {
                TextField("Введите код вступления", text: $joinPartyViewModel.code)
            }, footer: {
                Text("Код для присоединения к вечеринке вам должен прислать создатель или один из участников, код состоит из 6 символов")
            })
            
            Button(action: {joinPartyViewModel.join()}) {
                HStack {
                    Spacer()
                    Text("Войти")
                    Spacer()
                }
            }
            
            Button(action: {dismiss()}) {
                HStack {
                    Spacer()
                    Text("Назад")
                    Spacer()
                }
            }
        }
    }
}
