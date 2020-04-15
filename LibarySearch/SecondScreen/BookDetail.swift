//
//  BookDetail.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 13/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//
import UIKit
import SDWebImage

final class BookDetailViewModel: NSObject {
    private let book: BookLibraryResult

    init?(book: BookLibraryResult?) {
        guard let book = book else { return nil }
        self.book = book
    }

    func setAndCacheImage(in imageView: UIImageView?) {
        imageView?.sd_setImage(with: book.artworkUrl100, placeholderImage: nil)
    }

    func getBookTitle() -> String {
        return book.trackName
    }

    func getBookDescription() -> String? {
        return book.description
    }

}
