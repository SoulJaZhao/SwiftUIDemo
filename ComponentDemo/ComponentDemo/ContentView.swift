//
//  ContentView.swift
//  ComponentDemo
//
//  Created by 赵龙 on 2025/11/5.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    
    var body: some View {
        HStack {
            TextField("placeholder", text: $query)
                .border(.black)
            Button {
                print("button tapped")
            } label: {
                Text("Search")
            }

        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
