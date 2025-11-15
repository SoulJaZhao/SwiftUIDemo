//
//  QuickService.swift
//  QuickSwiftUI
//
//  Created by 赵龙 on 2025/11/14.
//

import Foundation
import Apollo
import QuickSwiftUIAPI

class QuickService {
    func fetchPokemonsResult(query: String, completion: @escaping ([PokemonQuery.Data.Pokemon], Error?) -> Void) -> (any Cancellable) {
        return Network.shared.apollo.fetch(query: PokemonQuery(name: query, limit: .none, offset: .none)) { result in
            switch result {
            case .success(let graphQLResult):
                completion(graphQLResult.data?.pokemon ?? [], nil)
            case .failure(let error):
                completion([], error)
            }
        }
    }
}
