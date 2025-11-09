//
//  ComponentViewModel.swift
//  ComponentDemo
//
//  Created by 赵龙 on 2025/11/5.
//

import Foundation
import Combine
import SwiftUI

class ComponentViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        bind()
    }
    
    private func bind() {
        $query
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                
            }
            .store(in: &cancellables)
    }
    
    func cancelSearch() {
        query = ""
        // isLoading will be updated by pipeline; also ensure immediate state
        self.isLoading = true
        
        Task {
            try? await Task.sleep(nanoseconds: 500_000_000) // Simulate delay
            await MainActor.run {
                self.isLoading = false
            }
        }
    }
}
