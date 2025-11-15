//
//  Network.swift
//  QuickSwiftUI
//
//  Created by 赵龙 on 2025/11/14.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()

    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.pokeapi.co/v1beta2")!)
}
