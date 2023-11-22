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
            title: "Explore",
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
