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
    
    // MARK: -- Создание вечеринки [POST]
    
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
    
    // MARK: -- Получение списка вечеринок [GET]
    
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
                print(partyListResponse)
                completion(.success(partyListResponse))
            } catch {
                print(error)
                completion(.failure(.custom(errorMessage: "Decoding error at [LoadPartyRequest]: \(error)")))
            }
        }
    }
    
    // MARK: -- Загрузить текующую вечеринку [GET]
    
    func loadCurrentParty(id: String, completion: @escaping (Result<Party, PartyError>) -> Void) {
        AF.request(API.BaseURL + "/party/\(id)",
                   method: .get,
                   headers: ["Authorization": self.token!]).response { response in
            guard let data = response.data else {
                completion(.failure(.custom(errorMessage: "[LoadCurrentParty] No data")))
                return
            }
            
            do {
                let partyResponse = try JSONDecoder().decode(Party.self, from: data)
                completion(.success(partyResponse))
            } catch {
                print(error)
                completion(.failure(.custom(errorMessage: "Decoding error at [LoadCurrentPartyRequest]: \(error)")))
            }
        }
    }
    
    // MARK: -- Вступление в вечеринку [POST]
    
    func joinToParty(joinPartyBody: JoinPartyRequestBody, completion: @escaping (Result<String, PartyError>) -> Void) {
        AF.request(API.BaseURL + "/party/member/\(id ?? "")",
                   method: .post,
                   parameters: joinPartyBody,
                   encoder: JSONParameterEncoder.default,
                   headers: ["Authorization": self.token!]).response { response in
            guard let data = response.data else {
                completion(.failure(.custom(errorMessage: "[JoinToParty] no data")))
                return
            }
            
            do {
                let partyJoinResponse = try JSONDecoder().decode(MessageResponse.self, from: data)
                completion(.success(partyJoinResponse.message))
            } catch {
                print(error)
                completion(.failure(.custom(errorMessage: "Decoding error at [JoinToPartyRequest]: \(error)")))
            }
        }
    }
    
    // MARK: -- Добавление товара пользователю в корзину [POST]
    
    func addItemToCart(addItemToCartBody: AddToCartRequestBody, partyId: String, completion: @escaping (Result<String, PartyError>) -> Void) {
        AF.request(API.BaseURL + "/party/\(partyId)/member/\(id ?? "")/add",
                   method: .post,
                   parameters: addItemToCartBody,
                   encoder: JSONParameterEncoder.default,
                   headers: ["Authorization": self.token!]).response { response in
            guard let data = response.data else {
                completion(.failure(.custom(errorMessage: "[AddItemToCart] no data")))
                return
            }
            
            debugPrint(response)
            
            do {
                let addItemToCartResponse = try JSONDecoder().decode(MessageResponse.self, from: data)
                completion(.success(addItemToCartResponse.message))
            } catch {
                print(error)
                completion(.failure(.custom(errorMessage: "Decoding error at [AddItemToCart]: \(error)")))
            }
        }
    }
    
    // MARK: -- Удаление товара из корзины [DELETE]
    
    func deleteItemFromCart(deleteItemFromCartBody: DeleteItemFromCartRequestBody, partyId: String, completion: @escaping(Result<String, PartyError>) -> Void) {
        
    }
    
    
    
    // MARK: -- Загрузка корзины пользователя [GET]
    
    func loadMemberCart(partyId: String, completion: @escaping(Result<[Party.Member.CartItem], PartyError>) -> Void) {
        
    }
    
    // MARK: -- Закрытие вечеринки [POST]
    
    func closeParty(partyId: String, completion: @escaping(Result<String, PartyError>) -> Void) {
        
    }
}
