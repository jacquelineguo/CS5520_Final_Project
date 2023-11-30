//
//  HomeViewController.swift
//  BiteSight
//
//  Created by Jacqueline Guo on 11/20/23.
//

import UIKit

class LandingViewController: UITabBarController, UITabBarControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Logout", // You can set your desired title
            style: .plain,
            target: self,
            action: #selector(leftBarButtonItemTapped)
        )
        
//        print("Key in landing:")
//        print(Validation.defaults.object(forKey: "auth"))
    }
    
    @objc func leftBarButtonItemTapped() {
//        Validation.defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
//        Validation.defaults.synchronize()
        Validation.defaults.removeObject(forKey: "auth")
//        Validation.defaults.synchronize()
//        print("Logout button tapped")
//        print(Validation.defaults.object(forKey: "auth"))
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: setting up red tab bar...
        let tabHome = UINavigationController(rootViewController: HomeViewController())
        let tabHomeBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        tabHome.tabBarItem = tabHomeBarItem
        
        //MARK: setting up green tab bar...
        let tabExplore = UINavigationController(rootViewController: ExploreViewController())
        let tabExploreBarItem = UITabBarItem(
            title: "Restaurants Near By",
            image: UIImage(systemName: "safari"),
            selectedImage: UIImage(systemName: "safari.fill")
        )
        tabExplore.tabBarItem = tabExploreBarItem
        
        //MARK: setting up blue tab bar...
        let tabFavorite = UINavigationController(rootViewController: FavoriteViewController())
        let tabFavoriteBarItem = UITabBarItem(
            title: "Favorite",
            image: UIImage(systemName: "heart"),
            selectedImage: UIImage(systemName: "heart.fill")
        )
        tabFavorite.tabBarItem = tabFavoriteBarItem
        //MARK: setting up this view controller as the Tab Bar Controller...
        self.viewControllers = [tabHome, tabExplore, tabFavorite]
    }
}
