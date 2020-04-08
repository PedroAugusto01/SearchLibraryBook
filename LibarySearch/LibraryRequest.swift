//
//  LibraryRequest.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 02/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

import Foundation

class LibraryRequest {
    let resourceURL:URL
    
    init(searchTerm:String) {
        let resourceString =
        "https://itunes.apple.com/search?term=swift&entity=ibook"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func getLibrary (completion: @escaping(Result<[LibraryResult], Error>) -> Void){
        let request = try! URLRequest(url: self.resourceURL)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                guard let data = data,
                    let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode,
                    error == nil else {
                    // Data was nil, validation failed or an error occurred.
                return
                }
                let board = try JSONDecoder().decode(Results.self, from: data)
                print("Created board title is \(board.results)") 
            } catch {
                print("Board creation failed with error: \(error.localizedDescription)")
            }
        }
    }
}
