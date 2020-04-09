//
//  ConvertAndHtmlSet.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 09/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

import Foundation


extension String {

    init?(htmlEncodedString: String) {

        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }

        self.init(attString.string)
    }

    func convertJSONToObject<T: Decodable>() -> T? {

        let decodedString = String(htmlEncodedString: self)

        guard let data = decodedString?.replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: "<\\/b>", with: "")
            .replacingOccurrences(of: "<\\/i>", with: "").data(using: .utf8) else {
            return nil
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as NSError {
            NSLog("⚠️⚠️⚠️ " + error.localizedDescription)
            return nil
        }
    }
}
