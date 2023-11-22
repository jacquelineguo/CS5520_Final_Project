//
//  ExploreViewController.swift
//  BiteSight
//
//  Created by (Vincent) GuoWei Li on 11/22/23.
//

import UIKit

class ExploreViewController: UIViewController {

    let exploreView = ExploreView()
    
    override func loadView() {
        view = exploreView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Explore"
    }

}
