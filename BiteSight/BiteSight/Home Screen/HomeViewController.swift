//
//  HomeViewController.swift
//  BiteSight
//
//  Created by (Vincent) GuoWei Li on 11/22/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController {

    let homeView = HomeView()
    var favorites = [Business]()
    var favoritesName = [String]()
    var businessList = [Business]()
    let dataService = DataService()
    let database = Firestore.firestore()
    
    override func loadView() {
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllFavorites()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        
        homeView.tableViewStores.delegate = self
        homeView.tableViewStores.dataSource = self
        
        LocationFetcher.shared.getUserLocation { location in
            print("location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            self.dataService.getCloseByRestaurants(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let businesses):
                        self.businessList = businesses
                        print("printing business: \(self.businessList)")
                        self.homeView.tableViewStores.reloadData()
                        // Update UI with businesses
                    case .failure(let error):
                        print("Error fetching businesses: \(error)")
                        // Handle error, update UI if needed
                    }
                }
            }
        }
    
        
    }
    
//    func getAllFavorites() {
//        favorites.removeAll()
//        favoritesName.removeAll()
//        
//        if let currUser = Validation.defaults.object(forKey: "auth") as! String? {
//            let businessCollection = database.collection("users").document(currUser).collection("businesses")
//            businessCollection.addSnapshotListener { (querySnapshot, error) in
//                guard let documents = querySnapshot?.documents else {
//                    print("No documents: \(error?.localizedDescription ?? "Unknown error")")
//                    return
//                }
//
//                for document in documents {
//                    var data = try? document.data(as: Business.self)
//                    if let business = data {
//                        self.favorites.append(business)
//                        if let name = business.name {
//                            self.favoritesName.append(name)
//                        }
//                    }
//                }
//
//            }
//        }
//    }
    
    func getAllFavorites() {
        favorites.removeAll()
        favoritesName.removeAll()

        if let currUser = Validation.defaults.object(forKey: "auth") as? String {
            let businessCollection = database.collection("users").document(currUser).collection("businesses")
            businessCollection.addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                self.favorites = documents.compactMap { document in
                    try? document.data(as: Business.self)
                }
                self.favoritesName = self.favorites.compactMap { $0.name }

                DispatchQueue.main.async {
                    self.homeView.tableViewStores.reloadData()
                }
            }
        }
    }


}
