//
//  SettingsTab.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 27.11.2021.
//

import SwiftUI

struct SettingsTabView: View {
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var profileModel: ProfileViewModel
    
    @State private var showMailView = false
    
    @State private var mailData = ComposeMailData(subject: "[BugReport] Find error \(Date.now)",
                                                    recipients: ["partyjoiner.app@gmail.com"],
                                                    message: "Сообщите об ошибке",
                                                    attachments: [AttachmentData(data: "".data(using: .utf8)!,
                                                                                 mimeType: "text/plain",
                                                                                 fileName: "text.txt")
                                                   ])
    
    var username: String {
        return profileModel.user.firstName != nil && profileModel.user.lastName != nil ? "\(profileModel.user.firstName!) \(profileModel.user.lastName!)" : ""
    }
    
    var email: String {
        return profileModel.user.email != nil ? "\(profileModel.user.email!)" : ""
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(content: {
                    Text(username)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(email)
                        .foregroundColor(.gray)
                }, header: {
                    Text("Пользователь")
                })
                
                Section(content: {
                    NavigationLink(destination: PartyHistoryView()) {
                        Image(systemName: "bookmark.square.fill")
                            .font(.system(size: 26))
                            .foregroundColor(.blue)
                        Text("История вечеринок")
                    }
                    
                    NavigationLink(destination: NotificationSettingsView()) {
                        Image(systemName: "bell.square.fill")
                            .font(.system(size: 26))
                            .foregroundColor(.red)
                        Text("Уведомления")
                    }
                    
                    NavigationLink(destination: LanguageSettingsView()) {
                        Image(systemName: "flag.square.fill")
                            .font(.system(size: 26))
                            .foregroundColor(.yellow)
                        Text("Язык")
                        
                        Spacer()
                        
                        Text("Русский")
                            .foregroundColor(.gray)
                    }
                })
                
                Section(content: {
                    Button(action: {showMailView.toggle()}, label: {
                        HStack {
                            Image(systemName: "exclamationmark.square.fill")
                                .font(.system(size: 26))
                                .foregroundColor(.orange)
                            Text("Нашли ошибку?")
                        }
                    })
                        .disabled(!MailView.canSendMail)
                        .sheet(isPresented: $showMailView, content: {
                            MailView(data: $mailData) { result in
                                print(result)
                            }
                        })
                })
                
                Section(content: {
                    Button(action: {loginViewModel.logout()}) {
                        HStack {
                            Spacer()
                            Text("Выйти")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                })
            }.navigationTitle("Настройки")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar() {
                    Button("Изм.", action: {print("Change print")})
                }
        }
    }
}
