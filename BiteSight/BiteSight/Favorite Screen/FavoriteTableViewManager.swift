//
//  FavoriteTableViewManager.swift
//  BiteSight
//
//  Created by Tiffany Zhang on 11/26/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewFavoriteID, for: indexPath) as! FavoriteTableViewCell
        
        cell.imagePhoto.image = favorites[indexPath.row].photo
        cell.labelName.text = favorites[indexPath.row].name
        cell.labelDescription.text = favorites[indexPath.row].description
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let user = Auth.auth().currentUser {
//            let chatController = ChatViewController()
//            chatController.chatID = chats[indexPath.row].id
//            chatController.selfEmail = user.email
//            chatController.friendName = chats[indexPath.row].friendName
//            
//            if let friendEmail = chats[indexPath.row].friends.first(where: { $0 != user.email }) {
//                // friendEmail now contains the first email in the array that is not user.email
//                print("Friend's email: \(friendEmail)")
//                chatController.friendEmail = friendEmail
//                navigationController?.pushViewController(chatController, animated: true)
//            } else {
//                // All emails in the array are equal to user.email, or the array is empty
//                print("No different email found")
//            }
//        }
//    }
}
