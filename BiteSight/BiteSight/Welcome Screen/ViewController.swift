//
//  ViewController.swift
//  BiteSight
//
//  Created by Jacqueline Guo on 11/20/23.
//

import UIKit

class ViewController: UIViewController {
    
    let welcomeView = WelcomeView()
    
    override func loadView() {
        view = welcomeView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Welcome"
        
        welcomeView.registerButton.addTarget(self, action: #selector(onRegisterButtonTapped), for: .touchUpInside)
    }
    
    @objc func onRegisterButtonTapped() {
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }


}

