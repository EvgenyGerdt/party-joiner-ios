//
//  ComposeMailData.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 30.11.2021.
//

import Foundation

struct ComposeMailData {
  let subject: String
  let recipients: [String]?
  let message: String
  let attachments: [AttachmentData]?
}

struct AttachmentData {
  let data: Data
  let mimeType: String
  let fileName: String
}
