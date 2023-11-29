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
    
    override func loadView() {
        view = exploreView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                            await self.downloadAndStoreImages()
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

    func downloadAndStoreImages() async {
        var downloadedImages = [UIImage?]()

        for business in businessList {
            if let urlString = business.imageUrl {
                let image = await self.downloadImage(urlString: urlString)
                downloadedImages.append(image)
            } else {
                downloadedImages.append(UIImage()) // Placeholder image
            }
        }

        // Update businessImages on the main thread after all downloads are complete
        DispatchQueue.main.async {
            self.businessImages = downloadedImages.compactMap { $0 } // Filter out nil images if necessary
            self.reloadImages()
        }
    }
    
    func reloadImages() {
        exploreView.kolodaView.reloadData()
    }

}

extension ExploreViewController: KolodaViewDelegate, KolodaViewDataSource {
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: businessImages[index])
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return businessImages.count
    }
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        self.reloadImages()
    }
}

