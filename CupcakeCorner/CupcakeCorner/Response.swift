//
//  Response.swift
//  CupcakeCorner
//
//  Created by 赵龙 on 2025/11/7.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
