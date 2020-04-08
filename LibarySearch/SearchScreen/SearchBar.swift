//
//  SearchBar.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 07/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

import UIKit
import Foundation



    extension ViewController:UISearchBarDelegate{
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            BooksRequest().fetchBookLisxtWith(searchText, resultLimit: 10) { bookList in
              self.bookArray = bookList
              self.MyTableView.reloadData()
              }
        }
    }
    



