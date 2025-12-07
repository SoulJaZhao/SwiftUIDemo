//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by 赵龙 on 2025/12/6.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
