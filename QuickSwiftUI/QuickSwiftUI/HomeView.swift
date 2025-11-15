//
//  ContentView.swift
//  QuickSwiftUI
//
//  Created by 赵龙 on 2025/11/14.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack(spacing: 8) {
                    // 输入框
                    TextField("Search", text: $vm.query)
                        .padding(10)
                        .border(.black)

                    // Cancel 按钮：无文本时禁用
                    Button("Cancel") {
                        vm.cancelSearch()
                    }
                    .disabled(vm.query.isEmpty)
                }
                .padding()
                List(vm.items, id: \.id) { pokemon in
                    NavigationLink {
                        QuickDetailView(pokemon: pokemon)
                    } label: {
                        QuickRowView(pokemon: pokemon)
                    }
                }
                .listStyle(.plain)
                .overlay {
                    if vm.isLoading {
                        HStack {
                            Spacer()
                            ProgressView("Loading")
                                .progressViewStyle(.circular)
                                .controlSize(.large)
                                .tint(.black)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
}


#Preview {
    HomeView()
}
