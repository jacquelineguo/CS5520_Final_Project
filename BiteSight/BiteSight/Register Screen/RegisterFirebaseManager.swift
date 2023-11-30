//
//  RegisterFirebaseManager.swift
//  BiteSight
//
//  Created by Jacqueline Guo on 11/20/23.
//

import UIKit
import Foundation
import FirebaseAuth
import FirebaseFirestore

extension RegisterViewController{
    
    func registerNewAccount(){
        showActivityIndicator()
        let name = registerView.nameTextField.text
        let email = registerView.emailTextField.text?.lowercased()
        let password = registerView.passwordTextField.text
        let city = registerView.cityTextField.text
        let state = registerView.stateTextField.text
        let zip = registerView.zipTextField.text
        
        if name?.isEmpty == true || email?.isEmpty == true || password?.isEmpty == true || city?.isEmpty == true || state?.isEmpty == true || zip?.isEmpty == true {
            showAlert(with: "Error", message: "All fields must be filled out.")
            self.hideActivityIndicator()
            return
        }
        
        if !isValidEmail(email) {
            showAlert(with: "Error", message: "Please provide correct email address.")
            self.hideActivityIndicator()
            return
        }
        
        if let zipInt = Int(zip ?? "0"), zipInt >= 1 && zipInt <= 99950 && zip?.count == 5 {
        } else {
            showAlert(with: "Error", message: "Zip code must be between 00001 and 99950 and contain only integers.")
            self.hideActivityIndicator()
            return
        }
        
        if let name = name, let email = email, let password = password {
                    Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                        if error == nil{
                            self.setNameOfTheUserInFirebaseAuth(name: name)
                            self.createUserDocument(withEmail: email.lowercased())
                        }else{
                            print(error)
                            self.hideActivityIndicator()
                        }
                    })
                }
    }

    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                self.hideActivityIndicator()
                self.navigationController?.popViewController(animated: true)
            }else{
                print("Error occured: \(String(describing: error))")
            }
        })
    }
    
    func createUserDocument(withEmail email: String) {
        // Get a reference to the Firestore database
        let db = Firestore.firestore()

        // Create a new document in the 'users' collection with the email as the document ID
        db.collection("users").document(email).setData([:]) { error in
            if let error = error {
                // Handle any errors
                print("Error creating user document: \(error)")
            } else {
                // Document was successfully created
                print("User document created successfully")
            }
        }
    }
    
    private func isValidEmail(_ email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func showAlert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

