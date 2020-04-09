//
//  Request.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 06/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

import Foundation
import Alamofire


public class BooksRequest {
    
    private let baseUrl = "https://itunes.apple.com/search?entity=ebook&term="
    
    func fetchBookLisxtWith(_ term: String, resultLimit: Int = 0, completion: @escaping (BookArrayList?) -> Void) {
        let urlString = urlBuilder(searchTerm: term, resultLimit: resultLimit)

        AF.request(urlString, method: .get).responseString { response in
            switch response.result {
            case .success(let data):
                let bookList: BookArrayList? = data.convertJSONToObject()
                completion(bookList)
            case .failure(let error):
                NSLog("Request failed with error: \(error)")
            }
        }
    }


private func urlBuilder(searchTerm: String, resultLimit: Int) -> String {
        var urlString = baseUrl + searchTerm

        if resultLimit > 0 {
            urlString += "&limit=" + String(resultLimit)
        }

        return urlString
        }
    }

