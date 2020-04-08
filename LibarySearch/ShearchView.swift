//
//  ShearchView.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 06/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

import Foundation

protocol BookSearchViewModelDelegate: class {
    func searchBarHasChangesToCommit()
    func searchButtonClicked()
}

enum BookSearchViewModelState {
    case showingHints
    case showingRecentSearchs
}

final class BookSearchViewModel: NSObject {

    private enum SearchKeys: String {
        case kLastSearched
    }

    private var recentSearchs: [String]
    let maxNumberOfHints = 5
    var searchHint: BookList?
    var searchedTerm: String?
    var hasPendingRequest: Bool = false
    var state: BookSearchViewModelState
    weak var delegate: BookSearchViewModelDelegate?

    override init() {
        state = .showingRecentSearchs
        recentSearchs = BookSearchViewModel.getRecentSearchs() ?? []
    }

    func updateRecentSearchsWithNewSearch(_ search: String?) {
        guard let search = search else { return }
        guard !recentSearchs.contains(search) else { return }
        recentSearchs.insert(search, at: 0)
        if recentSearchs.count > maxNumberOfHints {
            recentSearchs.removeLast()
        }

        StoredPreferences.shared.set(object: recentSearchs, forKey: SearchKeys.kLastSearched.rawValue)
    }

    func getBooksTitles() -> [String] {
        switch state {
        case .showingRecentSearchs:
            return recentSearchs
        case .showingHints:
            return searchHint?.books.map { $0.title } ?? []
        }
    }

    func getBook(at index: Int) -> Book? {
        guard let searchHint = searchHint else { return nil }
        guard searchHint.books.count > index else { return nil }
        return searchHint.books[index]
    }

    func setSearchedTermWithRecentSearchs(at index: Int) {
        guard recentSearchs.count > index else { return }
        searchedTerm = recentSearchs[index]
    }

    static private func getRecentSearchs() -> [String]? {
        return StoredPreferences.shared.stringArrayForKey(SearchKeys.kLastSearched.rawValue)
    }
}
