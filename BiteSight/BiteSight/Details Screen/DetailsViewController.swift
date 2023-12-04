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
    var isLiked = true
    
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
        if !isLiked {
            detailsView.buttonDislike.setTitle("Like", for: .normal)
        } else {
            detailsView.buttonDislike.setTitle("Dislike", for: .normal)
        }
        
        detailsView.buttonDislike.addTarget(self, action: #selector(onDislikeButtonTapped), for: .touchUpInside)
    }
    
    @objc func onDislikeButtonTapped() {
        if isLiked {
            let alert = UIAlertController(title: "Delete", message: "Are you sure to delete this restaurant from your favorites list?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default))
            alert.addAction(UIAlertAction(title: NSLocalizedString("Delete", comment: "Default action"), style: .default, handler: dislikeRestaurant))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Add favorite", message: "Add to your favorites list?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default))
            alert.addAction(UIAlertAction(title: NSLocalizedString("Add", comment: "Default action"), style: .default, handler: likeRestaurant))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func likeRestaurant(action: UIAlertAction) {
        guard let userEmail = Auth.auth().currentUser?.email else {
            print("No user signed in")
            return
        }
        // Reference to Firestore
        print("saving business to firebase ...")
        
        // Convert your business object to a dictionary
        let businessData: [String: Any?] = [
            "id": receivedRestaurant.id,
            "name": receivedRestaurant.name,
            "imageUrl": receivedRestaurant.imageUrl,
            "reviewCount": receivedRestaurant.reviewCount,
            "category": receivedRestaurant.category,
            "rating": receivedRestaurant.rating,
            "latitude": receivedRestaurant.latitude,
            "longtitude": receivedRestaurant.longtitude,
            "price": receivedRestaurant.price,
            "address": receivedRestaurant.address,
            "city": receivedRestaurant.city,
            "zipCode": receivedRestaurant.zipCode,
            "state": receivedRestaurant.state,
            "country": receivedRestaurant.country,
            "displayAddress": receivedRestaurant.displayAddress,
            "displayPhone": receivedRestaurant.displayPhone,
            "distance": receivedRestaurant.distance
        ]
        
        print("business data: \(businessData)")
        // Add the business data to the user's business collection
        self.database.collection("users").document(userEmail).collection("businesses").addDocument(data: businessData) { error in
            if let error = error {
                print("Error adding business document: \(error)")
            } else {
                print("Business document added successfully")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func dislikeRestaurant(action: UIAlertAction) {
        if let currUser = Validation.defaults.object(forKey: "auth") as! String? {
//            let documentRef = database.collection("users").document(currUser).collection("businesses").document(receivedRestaurant.docId!)
//            documentRef.delete { error in
//                if let error = error {
//                    print("Error deleting document: \(error)")
//                } else {
//                    print("Document successfully deleted.")
//                    self.navigationController?.popViewController(animated: true)
//                }
//            }
            
            let query = database.collection("users").document(currUser).collection("businesses").whereField("name", isEqualTo: receivedRestaurant.name)

            query.getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        // Delete the document
                        document.reference.delete { error in
                            if let error = error {
                                print("Error deleting document: \(error)")
                            } else {
                                print("Document successfully deleted.")
                                self.navigationController?.popViewController(animated: true)
                            }
                        }
                    }
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
