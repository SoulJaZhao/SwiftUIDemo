//
//  ContentView.swift
//  GraphQLDemo
//
//  Created by 赵龙 on 2025/10/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SearchScreen()
    }
}

struct SearchScreen: View {
    @StateObject private var vm = SearchVM()

    var body: some View {
        NavigationStack {
            Group {
                if vm.items.isEmpty && !vm.query.isEmpty && !vm.isLoading {
                    ContentUnavailableView("无结果", systemImage: "magnifyingglass", description: Text("试试更短或更精确的关键词"))
                } else {
                    List {
                        ForEach(vm.items) { item in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(item.title).font(.headline)
                                if !item.subtitle.isEmpty {
                                    Text(item.subtitle).font(.subheadline).foregroundStyle(.secondary)
                                }
                            }
                            .task { await vm.loadMoreIfNeeded(current: item) } // 触底加载
                        }

                        if vm.isLoading && !vm.items.isEmpty {
                            HStack { Spacer(); ProgressView(); Spacer() }
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                    .animation(.default, value: vm.items)
                }
            }
            .overlay { if vm.isLoading && vm.items.isEmpty { ProgressView().controlSize(.large) } }
            .navigationTitle("搜索")
            .searchable(text: $vm.query, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "输入名称")
            .onChange(of: vm.query, { oldValue, newValue in
                vm.scheduleSearch()
            
            })
            .alert("错误", isPresented: .constant(vm.error != nil), actions: {
                Button("OK") { vm.error = nil }
            }, message: { Text(vm.error ?? "") })
        }
    }
}


#Preview {
    ContentView()
}
