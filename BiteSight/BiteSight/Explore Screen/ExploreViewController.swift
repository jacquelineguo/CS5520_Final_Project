//
//  ExploreViewController.swift
//  BiteSight
//
//  Created by (Vincent) GuoWei Li on 11/22/23.
//

import UIKit
import CoreLocation

class ExploreViewController: UIViewController {

    let exploreView = ExploreView()
    
    override func loadView() {
        view = exploreView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        LocationFetcher.shared.getUserLocation { location in
            DispatchQueue.main.async {
                let coordinate = location.coordinate
                print(coordinate)
                self.exploreView.userLocationLabel.text = "\(coordinate.latitude), \(coordinate.longitude)"
            }
        }
    }
}
