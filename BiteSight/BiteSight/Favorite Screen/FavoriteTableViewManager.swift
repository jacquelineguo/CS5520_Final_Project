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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let user = Auth.auth().currentUser {
            let detailsController = DetailsViewController()
            detailsController.receivedRestaurant = favorites[indexPath.row]
            navigationController?.pushViewController(detailsController, animated: true)
        }
    }
}
