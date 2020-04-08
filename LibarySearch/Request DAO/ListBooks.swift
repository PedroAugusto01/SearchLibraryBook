//
//  ListBooks.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 07/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

import Foundation

struct BookList: Decodable {

    let books: [LibraryResult]
    let resultCount: Int

    enum CodingKeys: String, CodingKey {
        case kBooks = "results"
        case kResultCount = "resultCount"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        books = try values.decode([LibraryResult].self, forKey: .kBooks)
        resultCount = try values.decode(Int.self, forKey: .kResultCount)
    }
}
