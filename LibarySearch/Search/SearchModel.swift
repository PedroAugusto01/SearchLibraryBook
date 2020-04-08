//
//  SearchModel.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 06/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

/*import UIKit

struct ListBook: Decodable {

    let Book: [LibraryResult]
    let Count: Int

    enum CodingKeys: String, CodingKey {
        case Books = "results"
        case Counts = "resultCount"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        Book = try values.decode([LibraryResult].self, forKey: .Books)
        Count = try values.decode(Int.self, forKey: .Counts)
    }
}

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
        case ShearchLast
    }

    private var recentSearchs: [String]
    let maxNumberOfHints = 5
    var searchHint: ListBook?
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
        
        final class StorageSettings {
            static let Storage = StorageSettings()
            private let defaults = UserDefaults.standard

            private init() {}

            @discardableResult
            func set(object: Any?, forKey key: String) -> Bool {
                defaults.set(object, forKey: key)
                return defaults.synchronize()
            }

            func objectForKey(_ key: String) -> Any? {
                return defaults.object(forKey: key)
            }

            func stringArrayForKey(_ key: String) -> [String]? {
                return defaults.stringArray(forKey: key)
            }
        }
            
        StorageSettings.Storage.set(object: recentSearchs, forKey: SearchKeys.ShearchLast.rawValue)
    }

    func getBooksTitles() -> [String] {
        switch state {
        case .showingRecentSearchs:
            return recentSearchs
        case .showingHints:
            return searchHint?.Book.map { $0.trackName } ?? []
        }
    }

    func getBook(at index: Int) -> LibraryRequest? {
        guard let searchHint = searchHint else { return nil }
        guard searchHint.Book.count > index else { return nil }
        return searchHint.Book[index]
    }

    func setSearchedTermWithRecentSearchs(at index: Int) {
        guard recentSearchs.count > index else { return }
        searchedTerm = recentSearchs[index]
    }

    static private func getRecentSearchs() -> [String]? {
        return
            StorageSettings.Storage.set.stringArrayForKey(SearchKeys.SearchLast.rawValue)
    }
}
*/
