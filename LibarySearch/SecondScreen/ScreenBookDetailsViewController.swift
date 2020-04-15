//
//  PrimaryScreenViewController.swift
//  LibarySearch
//
//  Created by Pedro Augusto Marques de Souza on 03/04/20.
//  Copyright © 2020 Pedro Augusto Marques de Souza. All rights reserved.
//
import Alamofire
import UIKit
import SDWebImage



class ScreenBookDetailsViewController: UIViewController{
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descripitionLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var book: BookLibraryResult?
    
            override func viewDidLoad() {
            super.viewDidLoad()
                loadingUI()
        }
    
    private func loadingUI(){
        
        func setAndCacheImage(in setImage: UIImageView?) {
            setImage?.sd_setImage(with: book?.artworkUrl100, placeholderImage: nil)
        }
        setAndCacheImage(in: imageView)
        titleLabel?.text = book?.trackName
        descripitionLabel?.text = book?.description
    }
    
    }

