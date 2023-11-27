//
//  DetailsViewController.swift
//  BiteSight
//
//  Created by Tiffany Zhang on 11/26/23.
//

import UIKit

class DetailsViewController: UIViewController {
    let detailsView = DetailsView()
    var receivedRestaurant: Restaurant!
    
    override func loadView() {
        view = detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        detailsView.labelName.text = receivedRestaurant.name
        detailsView.labelAddress.text = receivedRestaurant.address
        detailsView.labelZip.text = receivedRestaurant.zip
        detailsView.labelLikes.text = "❤️ \(receivedRestaurant.likes) likes"
        detailsView.imagePhoto.image = receivedRestaurant.photo
        detailsView.labelDetails.text = receivedRestaurant.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
