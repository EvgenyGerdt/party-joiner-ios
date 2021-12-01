//
//  CreatePartyTab.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 27.11.2021.
//

import SwiftUI

struct CreatePartyTabView: View {
    
    @EnvironmentObject var createPartyViewModel: CreatePartyViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(content: {
                    TextField("Название", text: $createPartyViewModel.name)
                })
                
                Section(content: {
                    TextField("Описание", text: $createPartyViewModel.description)
                }, footer: {
                    Text("Опишите цель вечеринки или же просто расскажите, что планируется, например \"День рождения Женька!\"")
                })
                
                Section(content: {
                    DatePicker("Начало вечеринки",
                               selection: $createPartyViewModel.willHappenAt,
                               in: Date.now...,
                               displayedComponents: .date)
                    TextField("Локация", text: $createPartyViewModel.location)
                })
                
                if !createPartyViewModel.hasLoading {
                    Button(action: {createPartyViewModel.createParty()}) {
                        HStack {
                            Spacer()
                            Text("Создать")
                            Spacer()
                        }
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1)
                }
                
            }.navigationTitle("Создать вечеринку")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
