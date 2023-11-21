//
//  HomeViewController.swift
//  BiteSight
//
//  Created by Jacqueline Guo on 11/20/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeScreen = HomeView()
    
    override func loadView() {
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
    }
    
}
