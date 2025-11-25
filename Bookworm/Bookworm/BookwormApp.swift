//
//  BookwormApp.swift
//  Bookworm
//
//  Created by 赵龙 on 2025/11/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
