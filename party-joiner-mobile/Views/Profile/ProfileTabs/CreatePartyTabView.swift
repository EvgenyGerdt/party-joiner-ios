//
//  CreatePartyTab.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 27.11.2021.
//

import SwiftUI

struct CreatePartyTabView: View {
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var location: String = ""
    @State private var date: Date = Date.now
    
    var body: some View {
        NavigationView {
            Form {
                Section(content: {
                    TextField("Название", text: $name)
                })
                
                Section(content: {
                    TextField("Описание", text: $description)
                }, footer: {
                    Text("Опишите цель вечеринки или же просто расскажите, что планируется, например \"День рождения Женька!\"")
                })
                
                Section(content: {
                    DatePicker("Начало вечеринки",
                               selection: $date,
                               in: Date.now...,
                               displayedComponents: .date)
                    TextField("Локация", text: $location)
                })
                
                Button("Создать", action: {print("Create Party")})
                
            }.navigationTitle("Создать вечеринку")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
