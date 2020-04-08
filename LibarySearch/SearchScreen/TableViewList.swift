//
//  TableViewList.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 07/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

import Foundation

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookSearchViewModel?.getBooksTitles().count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookSearchCell.identifier,
                                                 for: indexPath) as? BookSearchCell

        cell?.titleLabel?.text = bookSearchViewModel?.getBooksTitles()[indexPath.row]

        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let bookSearchViewModel = bookSearchViewModel else { return }

        switch bookSearchViewModel.state {
        case .showingHints:
            let book = bookSearchViewModel.getBook(at: indexPath.row)
            Router.presentBookDetailModally(book, over: self)

        case .showingRecentSearchs:
            bookSearchViewModel.setSearchedTermWithRecentSearchs(at: indexPath.row)
            Router.pushBookList(over: self, searchingTerm: bookSearchViewModel.searchedTerm)
        }
    }
}
