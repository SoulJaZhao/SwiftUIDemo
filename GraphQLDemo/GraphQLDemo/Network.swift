//
//  Network.swift
//  GraphQLDemo
//
//  Created by 赵龙 on 2025/10/31.
//

import Apollo
import Foundation

enum Network {
    static let shared: ApolloClient = {
        // Demo 用公共端点；真实项目替换为你的 GraphQL 地址
        let url = URL(string: "https://rickandmortyapi.com/graphql")!
        // 如需自定义 Header：
        // let config = URLSessionConfiguration.default
        // config.httpAdditionalHeaders = ["Authorization": "Bearer <token>"]
        // let transport = RequestChainNetworkTransport(interceptorProvider: LegacyInterceptorProvider(client: URLSessionClient(configuration: config)),
        //                                              endpointURL: url)
        // return ApolloClient(networkTransport: transport)
        return ApolloClient(url: url)
    }()
}

