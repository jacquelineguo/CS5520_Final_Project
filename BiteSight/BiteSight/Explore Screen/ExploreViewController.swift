////
////  ExploreViewController.swift
////  BiteSight
////
////  Created by (Vincent) GuoWei Li on 11/22/23.
////
//
import UIKit
import CoreLocation
import Alamofire
import Koloda

class ExploreViewController: UIViewController {
    
    let exploreView = ExploreView()
    let dataService = DataService()
    var businessList = [Business]()
    var businessImages = [UIImage]()
    var businessCards = [BusinessCardView]()
    
    override func loadView() {
        view = exploreView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Restaurants Near By"
        exploreView.kolodaView.delegate = self
        exploreView.kolodaView.dataSource = self
        view.backgroundColor = .white
        LocationFetcher.shared.getUserLocation { location in
            print("location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            self.dataService.getCloseByRestaurants(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let businesses):
                        self.businessList = businesses
                        print("printing business: \(self.businessList)")
                        Task {
                            await self.setupBusinessCards()
                        }
                        // Update UI with businesses
                    case .failure(let error):
                        print("Error fetching businesses: \(error)")
                        // Handle error, update UI if needed
                    }
                }
            }
        }
    }
    
    // Asynchronous function to download an image
    func downloadImage(urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else {
            return nil // Return nil if URL is invalid
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return UIImage(data: data)
        } catch {
            return nil // Return nil in case of an error
        }
    }

    func setupBusinessCards() async {
//        var downloadedImages = [UIImage?]()
        var tempBusinessCards = [BusinessCardView]()
        print("entering setupBusinessCards:")
        print("businessCards initial count: \(businessCards.count)")
        for business in businessList {
            print("iterating business list")
            if let urlString = business.imageUrl {
                let image = await self.downloadImage(urlString: urlString)
                let businessImage = image ?? UIImage(named: "default_restaurant") // Replace "defaultImage" with your default image name
                let businessName = business.name ?? ""
                let businessCategory = business.categories?.first?.title ?? ""
//                print("business name is: \(name)")
//                print("business category title is: \(categoryTitle)")
                let card = BusinessCardView()
                card.businessImage.image = businessImage
                print("set image")
                card.businessName.text = businessName.uppercased()
                print("set name")
                card.businessCategory.setTitle(businessCategory.uppercased(), for: .normal)
                print("set title")
//                downloadedImages.append(image)
                tempBusinessCards.append(card)
                print("added card to temp")
                print("temp count: \(tempBusinessCards.count)")

            } else {
//                downloadedImages.append(UIImage()) // Placeholder image
                tempBusinessCards.append(BusinessCardView())
            }
        }
        
//        print("final businessCards count: \(tempBusinessCards.count)")

        // Update businessImages on the main thread after all downloads are complete
        DispatchQueue.main.async {
            print("final businessCards count: \(tempBusinessCards.count)")

//            self.businessImages = downloadedImages.compactMap { $0 } // Filter out nil images if necessary
//            self.reloadImages()
            self.businessCards = tempBusinessCards
            self.reloadImages()
        }
    }
    
    func reloadImages() {
        exploreView.kolodaView.reloadData()
    }

}

extension ExploreViewController: KolodaViewDelegate, KolodaViewDataSource {
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
//        return UIImageView(image: businessImages[index])
        return businessCards[index]
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
//        return businessImages.count
        return businessCards.count
    }
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        self.reloadImages()
    }
}

