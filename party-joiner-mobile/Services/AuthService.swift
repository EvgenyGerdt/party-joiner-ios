//
//  AuthService.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 24.11.2021.
//

import Foundation
import Alamofire
import Combine

enum AuthenticationError: Error {
    case InvalidCredentials
    case AlreadyExists
    case custom(errorMessage: String)
}

class AuthService: ObservableObject {

    func login(user: LoginRequestBody, completion: @escaping (Result<LoginResponse, AuthenticationError>) -> Void) {
        AF.request(API.BaseURL + "/auth/login",
                   method: .post,
                   parameters: user,
                   encoder: JSONParameterEncoder.default).response { response in
            guard let data = response.data else {
                completion(.failure(.InvalidCredentials))
                return
            }
            
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                completion(.failure(.custom(errorMessage: "Decoding error at [Login Request]: \(error)")))
            }
        }
    }
    
    func register(user: RegisterRequestBody, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        AF.request(API.BaseURL + "/auth/register",
                   method: .post,
                   parameters: user,
                   encoder: JSONParameterEncoder.default).response { response in
            guard let data = response.data else {
                completion(.failure(.custom(errorMessage: "Response body is null")))
                return
            }
            
            debugPrint(data)
        }
    }
}
