//
//  ProfileViewController.swift
//  BiteSight
//
//  Created by Jacqueline Guo on 12/5/23.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileView = ProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }

}
