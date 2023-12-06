//
//  ProfileViewController.swift
//  BiteSight
//
//  Created by Jacqueline Guo on 12/5/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import PhotosUI
import FirebaseStorage

class ProfileViewController: UIViewController {

    let profileView = ProfileView()
    
    let storage = Storage.storage()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser: FirebaseAuth.User?
    var userListener: ListenerRegistration?
    var email: String!
    var pickedImage: UIImage?
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Me"
        
        handleAuth = Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.currentUser = user
                self.email = user.email
                self.profileView.nameLabel.text = "Name: \(user.displayName ?? "Anonymous")"
                self.profileView.emailLabel.text = "Email: \(user.email ?? "None")"
                self.listenForUserProfileChanges(uid: user.email!)
                self.getLocationData()
            }
        }
    }
    
    deinit {
        handleAuth.map(Auth.auth().removeStateDidChangeListener)
        userListener?.remove()
    }
    
    private func listenForUserProfileChanges(uid: String) {
        userListener = Firestore.firestore().collection("users").document(uid).addSnapshotListener { documentSnapshot, error in
            // Safely unwrap the error and handle it
            if let error = error {
                print("Error fetching document: \(error)")
                return
            }

            // Proceed if the document exists and there's no error
            guard let document = documentSnapshot, document.exists else {
                print("Document does not exist")
                return
            }

            if let data = document.data(), let updatedName = data["name"] as? String {
                self.profileView.nameLabel.text = "Name: \(updatedName)"
            }
        }
    }
    
    private func getLocationData() {
        let db = Firestore.firestore()
        let usersCollection = db.collection("users")
        usersCollection.document(self.email).getDocument{ (document, error) in
            if let error = error {
                print("Error fetching user: \(error.localizedDescription)")
                return
            }
            
            if let document = document, document.exists {
                let city = document.data()?["city"] as? String
                let state = document.data()?["state"] as? String
                let zip = document.data()?["zip"] as? String
                print("yayaya")
                self.profileView.cityLabel.text = "City: \(city ?? "None")"
                self.profileView.stateLabel.text = "State: \(state ?? "None")"
                self.profileView.zipLabel.text = "Zip: \(zip ?? "None")"
                if let url = self.currentUser?.photoURL{
                    self.profileView.imageIcon.loadRemoteImage(from: url)
                }
            } else {
                print("Document does not exist")
            }
        }
    }

}
