//
//  ContentView.swift
//  Navigation
//
//  Created by 赵龙 on 2025/11/5.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path, root: {
            VStack {
                Button("Show 32") {
                    path = [32]
                }

                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Tap Me") {
                        // button action here
                    }

                    Button("Tap Me 2") {
                        // button action here
                    }
                }
            }
        })
    }
}

#Preview {
    ContentView()
}
