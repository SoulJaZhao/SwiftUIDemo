//
//  SearchVM.swift
//  GraphQLDemo
//
//  Created by 赵龙 on 2025/10/31.
//

import Apollo
import Foundation

struct CharacterRow: Identifiable, Hashable {
    let id: String
    let title: String
    let subtitle: String
}

@MainActor
final class SearchVM: ObservableObject {
    @Published var query: String = ""
    @Published var items: [CharacterRow] = []
    @Published var isLoading: Bool = false
    @Published var error: String?

    private var searchTask: Task<Void, Never>?
    private var nextPage: Int? = nil
    private var lastKeyword: String = ""

    // 输入变更时调用：350ms 防抖 + 自动取消旧任务
    func scheduleSearch() {
        searchTask?.cancel()
        let keyword = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !keyword.isEmpty else {
            items = []; error = nil; nextPage = nil; lastKeyword = ""
            return
        }
        searchTask = Task { [weak self] in
            try? await Task.sleep(nanoseconds: 350_000_000)
            guard !Task.isCancelled else { return }
            await self?.performNewSearch(keyword: keyword)
        }
    }

    func performNewSearch(keyword: String) async {
        isLoading = true; error = nil
        lastKeyword = keyword; nextPage = 1
        items.removeAll()

        await fetch(page: 1, keyword: keyword)
    }

    func loadMoreIfNeeded(current item: CharacterRow) async {
        guard !isLoading,
              let last = items.last, last.id == item.id,
              let page = nextPage else { return }
        await fetch(page: page, keyword: lastKeyword)
    }

    private func fetch(page: Int, keyword: String) async {
        isLoading = true
        defer { isLoading = false }

        do {
            let q = RMAPI.SearchCharactersQuery(name: keyword, page: .some(Int32(page)))
            let resp = try await Network.shared.fetch(query: q)
            let data = resp.data?.characters
            let rows: [CharacterRow] = (data?.results ?? [])
                .compactMap { $0 }
                .compactMap {
                    guard let id = $0.id, let name = $0.name else { return nil }
                    return CharacterRow(id: id, title: name, subtitle: $0.species ?? "")
                }

            // 合并 + 去重
            let existing = Set(items)
            let newOnes = rows.filter { !existing.contains($0) }
            items.append(contentsOf: newOnes)

            // 下一页
            if let n = data?.info?.next {
                nextPage = n
            } else {
                nextPage = nil
            }
        } catch {
            self.error = error.localizedDescription
            self.items = []
            self.nextPage = nil
        }
    }
}

