//
//  UserService.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 29.11.2021.
//

import Foundation
import Alamofire

enum UserError: Error {
    case EmptyToken
    case custom(errorMessage: String)
}

class UserService: ObservableObject {
    
    private var token: String? = UserDefaults.standard.string(forKey: "token")
    private var id = UserDefaults.standard.string(forKey: "id")
    
    func loadUser(completion: @escaping (Result<User, UserError>) -> Void) {
        AF.request(API.BaseURL + "/user/\(id ?? "nil")",
                   method: .get,
                   headers: ["Authorization": self.token!]).response { response in
            guard let data = response.data else {
                completion(.failure(.EmptyToken))
                return
            }
            
            do {
                let loadUserResponse = try JSONDecoder().decode(User.self, from: data)
                completion(.success(loadUserResponse))
            } catch {
                completion(.failure(.custom(errorMessage: "Decoding error at [LoadUser Request]: \(error)")))
            }
        }
    }
}
