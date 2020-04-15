//
//  LibraryResults.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 02/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

import Foundation

struct BookArrayList: Decodable {
    
    let books: [BookLibraryResult]
    let resultCount: Int
    
    enum CodingKeys: String, CodingKey {
        case listBook = "results"
        case listResultCount = "resultCount"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        books = try values.decode([BookLibraryResult].self, forKey: .listBook)
        resultCount = try values.decode(Int.self, forKey: .listResultCount)
    }
}



struct BookLibraryResult:Decodable {
    var artworkUrl100:URL?
    var trackName: String
    var description: String?
    
    enum CodingKeys: String, CodingKey {
            case Title = "trackName"
            case ThumbURL = "artworkUrl100"
            case Description = "description"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            trackName = try values.decode(String.self, forKey: .Title)
            description = try? values.decode(String.self, forKey: .Description)


            if let thumbURLString = try? values.decode(String.self, forKey: .ThumbURL) {
                artworkUrl100 = URL(string: thumbURLString)
            } else {
                artworkUrl100 = nil
            }
        }
    }
    



