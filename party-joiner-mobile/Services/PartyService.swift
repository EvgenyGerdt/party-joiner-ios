//
//  PartyService.swift
//  party-joiner-mobile
//
//  Created by Evgeny Gerdt on 30.11.2021.
//

import Foundation
import Alamofire

enum PartyError: Error {
    case custom(errorMessage: String)
}

class PartyService: ObservableObject {
    
    private var token: String? = UserDefaults.standard.string(forKey: "token")
    private var id = UserDefaults.standard.string(forKey: "id")
    
    func createParty(party: CreatePartyRequestBody, completion: @escaping (Result<String, PartyError>) -> Void) {
        AF.request(API.BaseURL + "/party/create",
                   method: .post,
                   parameters: party,
                   encoder: JSONParameterEncoder.default,
                   headers: ["Authorization": self.token!]).response { response in
            guard let data = response.data else {
                completion(.failure(.custom(errorMessage: "[CreatePartyError] No data")))
                return
            }
            
            do {
                let msgResponse = try JSONDecoder().decode(MessageResponse.self, from: data)
                completion(.success(msgResponse.message))
            } catch {
                completion(.failure(.custom(errorMessage: "Decoding error at [CreatePartyRequest]: \(error)")))
            }
        }
    }
    
    func loadPartyList(completion: @escaping (Result<[Party], PartyError>) -> Void) {
        AF.request(API.BaseURL + "/party/list/\(id ?? "")",
                   method: .get,
                   headers: ["Authorization": self.token!]).response { response in
            guard let data = response.data else {
                completion(.failure(.custom(errorMessage: "[LoadPartyList] No data")))
                return
            }
            
            do {
                let partyListResponse = try JSONDecoder().decode([Party].self, from: data)
                completion(.success(partyListResponse))
            } catch {
                print(error)
                completion(.failure(.custom(errorMessage: "Decoding error at [LoadPartyRequest]: \(error)")))
            }
        }
    }
}
