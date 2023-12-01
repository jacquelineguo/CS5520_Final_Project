//
//  DetailsViewController.swift
//  BiteSight
//
//  Created by Tiffany Zhang on 11/26/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class DetailsViewController: UIViewController {
    let detailsView = DetailsView()
    var receivedRestaurant: Restaurant!
    let database = Firestore.firestore()
    
    override func loadView() {
        view = detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        detailsView.labelName.text = receivedRestaurant.name
        Validation.urlToImage(receivedRestaurant.imageUrl) { image in
            DispatchQueue.main.async {
                self.detailsView.imagePhoto.image = image
            }
        }
        if let address = receivedRestaurant.address {
            detailsView.labelAddress.text = address
        }
        if let city = receivedRestaurant.city {
            detailsView.labelCity.text = city
        }
        if let state = receivedRestaurant.state {
            if let currCity = detailsView.labelCity.text {
                detailsView.labelCity.text = currCity + ", \(state)"
            } else {
                detailsView.labelCity.text = state
            }
        }
        if let zip = receivedRestaurant.zipCode {
            if let currCity = detailsView.labelCity.text {
                detailsView.labelCity.text = currCity + " \(zip)"
            } else {
                detailsView.labelCity.text = zip
            }
        }
        if let phone = receivedRestaurant.displayPhone {
            detailsView.labelPhone1.text = phone
        }
        if let category = receivedRestaurant.category {
            detailsView.labelCategory1.text = category
        }
        if let price = receivedRestaurant.price {
            detailsView.labelPrice1.text = price
        }
        if let rating = receivedRestaurant.rating {
            detailsView.labelRating1.text = "\(rating)"
        }
        
        detailsView.buttonDislike.addTarget(self, action: #selector(onDislikeButtonTapped), for: .touchUpInside)
    }
    
    @objc func onDislikeButtonTapped() {
        let alert = UIAlertController(title: "Delete", message: "Are you sure to delete this restaurant from your favorites list?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Delete", comment: "Default action"), style: .default, handler: dislikeRestaurant))
        self.present(alert, animated: true, completion: nil)
    }
    
    func dislikeRestaurant(action: UIAlertAction) {
        if let currUser = Validation.defaults.object(forKey: "auth") as! String? {
            let documentRef = database.collection("users").document(currUser).collection("businesses").document(receivedRestaurant.docId!)
            documentRef.delete { error in
                if let error = error {
                    print("Error deleting document: \(error)")
                } else {
                    print("Document successfully deleted.")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
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
