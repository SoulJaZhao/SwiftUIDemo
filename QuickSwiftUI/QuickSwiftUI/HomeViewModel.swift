//
//  HomeViewModel.swift
//  QuickSwiftUI
//
//  Created by 赵龙 on 2025/11/14.
//

import Foundation
import Combine
import QuickSwiftUIAPI
import Apollo

final class HomeViewModel: ObservableObject {
    // 输入
    @Published var query: String = ""
    // 输出
    @Published var items: [PokemonQuery.Data.Pokemon] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private var service = QuickService()
    private var fetchingPokemonsResultCancellable: (any Apollo.Cancellable)?
    private var cancellables = Set<AnyCancellable>()

    init() {
        bindSearch()
    }

    /// 绑定搜索输入：debounce + 去重
    private func bindSearch() {
        $query
            .removeDuplicates()
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] text in
                guard let self = self else { return }
                self.searchIfNeeded(text)
            }
            .store(in: &cancellables)
    }

    /// 执行搜索（空串时清空并返回）
    func searchIfNeeded(_ text: String) {
        let searchText = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if searchText.isEmpty {
            cancelSearch()
            return
        }
        errorMessage = nil
        items = []
        isLoading = true
        fetchingPokemonsResultCancellable?.cancel()
        
        fetchingPokemonsResultCancellable = service.fetchPokemonsResult(query: searchText) {  [weak self] (pokemons, error) in
            guard let self else { return }
            if let e = error {
                self.errorMessage = e.localizedDescription
            } else {
                self.items = pokemons
                print(pokemons)
            }
            isLoading = false
        }
    }


    /// Cancel 行为：清空输入和结果
    func cancelSearch() {
        query = ""
        errorMessage = nil
        isLoading = false
        items = []
    }
}

