//
//  ContentView.swift
//  Instafilter
//
//  Created by 赵龙 on 2025/11/27.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        image = Image("")
    }
}

#Preview {
    ContentView()
}
