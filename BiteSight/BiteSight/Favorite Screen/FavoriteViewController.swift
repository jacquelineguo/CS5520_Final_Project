//
//  FavoriteViewController.swift
//  BiteSight
//
//  Created by (Vincent) GuoWei Li on 11/22/23.
//

import UIKit

class FavoriteViewController: UIViewController {

    let favoriteView = FavoriteView()
    
    override func loadView() {
        view = favoriteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Favorite"
    }
}
