//
//  HomeViewController.swift
//  BiteSight
//
//  Created by (Vincent) GuoWei Li on 11/22/23.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()
//    var stores = [Restaurant]()
    var businessList = [Business]()
    let dataService = DataService()
    
//    func createMockData() {
//        stores.append(Restaurant(
//            docId: "1",
//            id: "101",
//            name: "The Gourmet Hut",
//            category: "Italian",
//            imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/9XsrIyGeuD3QKbC-8Wrx8A/o.jpg",
//            price: "$$",
//            rating: 4,
//            reviewCount: 150,
//            address: "123 Pizza Street",
//            city: "Naples",
//            state: "NA",
//            country: "Italy",
//            zipCode: "80100",
//            displayAddress: ["123 Pizza Street", "Naples, NA 80100"],
//            displayPhone: "+390812345678",
//            distance: 0.5,
//            latitude: 40.8518,
//            longtitude: 14.2681
//        ))
//
//        stores.append(Restaurant(
//            docId: "2",
//            id: "102",
//            name: "Café Delight",
//            category: "Café",
//            imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/9XsrIyGeuD3QKbC-8Wrx8A/o.jpg",
//            price: "$",
//            rating: 5,
//            reviewCount: 200,
//            address: "456 Coffee Road",
//            city: "Vienna",
//            state: "VI",
//            country: "Austria",
//            zipCode: "1010",
//            displayAddress: ["456 Coffee Road", "Vienna, VI 1010"],
//            displayPhone: "+43123456789",
//            distance: 1.2,
//            latitude: 48.2082,
//            longtitude: 16.3738
//        ))
//
//        stores.append(Restaurant(
//            docId: "3",
//            id: "103",
//            name: "Sushi Central",
//            category: "Japanese",
//            imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/9XsrIyGeuD3QKbC-8Wrx8A/o.jpg",
//            price: "$$$",
//            rating: 4,
//            reviewCount: 250,
//            address: "789 Sushi Blvd",
//            city: "Tokyo",
//            state: "TK",
//            country: "Japan",
//            zipCode: "100-0001",
//            displayAddress: ["789 Sushi Blvd", "Tokyo, TK 100-0001"],
//            displayPhone: "+81312345678",
//            distance: 3.0,
//            latitude: 35.6895,
//            longtitude: 139.6917
//        ))
//
//        stores.append(Restaurant(
//            docId: "4",
//            id: "104",
//            name: "Burger Town",
//            category: "American",
//            imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/9XsrIyGeuD3QKbC-8Wrx8A/o.jpg",
//            price: "$",
//            rating: 3,
//            reviewCount: 100,
//            address: "321 Burger Ave",
//            city: "New York",
//            state: "NY",
//            country: "USA",
//            zipCode: "10001",
//            displayAddress: ["321 Burger Ave", "New York, NY 10001"],
//            displayPhone: "+12125551234",
//            distance: 0.8,
//            latitude: 40.7128,
//            longtitude: -74.0060
//        ))
//
//        stores.append(Restaurant(
//            docId: "5",
//            id: "105",
//            name: "Taco Fiesta",
//            category: "Mexican",
//            imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/9XsrIyGeuD3QKbC-8Wrx8A/o.jpg",
//            price: "$$",
//            rating: 5,
//            reviewCount: 300,
//            address: "987 Taco Street",
//            city: "Mexico City",
//            state: "DF",
//            country: "Mexico",
//            zipCode: "01000",
//            displayAddress: ["987 Taco Street", "Mexico City, DF 01000"],
//            displayPhone: "+525512345678",
//            distance: 2.5,
//            latitude: 19.4326,
//            longtitude: -99.1332
//        ))
//    }
    
    override func loadView() {
        view = homeView
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

}
