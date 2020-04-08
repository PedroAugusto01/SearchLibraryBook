//
//  ViewController.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 02/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
   
    @IBOutlet weak var MyTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var  bookArray: BookArrayList?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyTableView.dataSource = self
        MyTableView.delegate = self
        searchBar.delegate = self
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray?.books.count ?? 0
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"MyCell", for: indexPath)
        cell.textLabel?.text = bookArray?.books[indexPath.row].trackName ?? ""
        return cell
        
       }
    

    

    
    
    
  // @IBAction func searchButtonTap(_ sender: UIButton) {
        
       /* if textField.text == ""{
            return
        }
        
        search.append(textField.text!)
        textField.text = ""
        textField.resignFirstResponder()
        tableview.reloadData()*/
        
        
        
    //}
    
    
    
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return search.count
    }

   
    
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell (withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
            configureCell(cell: cell, atIndexPath: indexPath as NSIndexPath)
        
        
        return cell
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath){
        let searc = search[indexPath.row]
        cell.textLabel?.text = searc
    }*/
    
    
}

