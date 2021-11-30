//
//  NotificationSettingsView.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 30.11.2021.
//

import SwiftUI

struct NotificationSettingsView: View {
    @State private var soundNotifications = true
    @State private var vibrateNotifications = true
    
    var body: some View {
        Form {
            Section(content: {
                Toggle("Звук", isOn: $soundNotifications)
                Toggle("Вибрация", isOn: $vibrateNotifications)
            }, header: {
                Text("Уведомления в приложении")
            })
        }.navigationTitle("Уведомления")
    }
}
