//
//  ContentView.swift
//  ComponentDemo
//
//  Created by 赵龙 on 2025/11/5.
//

import SwiftUI
import UIKit

@available(iOS 16.0, *)
struct ContentView: View {
    @StateObject private var viewModel = ComponentViewModel()
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    TextField("Search Pokemon", text: $viewModel.query)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    Button() {
                        viewModel.cancelSearch()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(viewModel.query.isEmpty ? .gray : .blue)
                    }
                    
                    .disabled(viewModel.query.isEmpty)
                }
                .padding(.horizontal)

                List {
                    
                }
                .overlay {
                    if viewModel.isLoading {
                        HStack {
                            Spacer()
                            ProgressView("Loading")
                                .progressViewStyle(.circular)
                                .controlSize(.large)
                                .tint(.red)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Navigation")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        ContentView()
    } else {
        // Fallback on earlier versions
    }
}

