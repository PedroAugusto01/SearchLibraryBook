//
//  BookItensList.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 09/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

import UIKit
import SDWebImage

final class BookListViewModel: NSObject {
    private let searchedTerm: String
    private var books: BookArrayList?

    init?(term: String?) {
        guard let term = term else { return nil }
        searchedTerm = term

        SDImageCache.shared.config.maxDiskAge = 60 * 60 * 1 // cache last for one hour
    }

    func setup(completion: @escaping () -> Void) {
        BooksRequest().fetchBookLisxtWith(searchedTerm) { [weak self] bookList in
            self?.books = bookList
            completion()
        }
    }

    func getBook(at index: Int) -> LibraryResult? {
        guard let books = books else { return nil }
        guard books.books.count > index else { return nil }
        return books.books[index]
    }

    func numberOfBooks() -> Int {
        return books?.books.count ?? 0
    }

    func titleForIndex(_ index: Int) -> String? {
        guard index < books?.books.count ?? 0 else { return nil }
        return books?.books[index].trackName
    }


    func setAndCacheImage(in imageView: UIImageView?, bookIndex: Int) {
        guard bookIndex < books?.books.count ?? 0 else { return }
        imageView?.sd_setImage(with: books?.books[bookIndex].artworkUrl100, placeholderImage: nil)
    }
}



