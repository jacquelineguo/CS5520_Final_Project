//
//  ContactsTableViewManager.swift
//  App12
//
//  Created by Sakib Miazi on 6/2/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businessList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewHomeID, for: indexPath) as! HomeTableViewCell
        cell.labelName.text = businessList[indexPath.row].name
        if let address = businessList[indexPath.row].location?.address1 {
            cell.labelAddress.text = address
        }
        cell.labelPrice.text = businessList[indexPath.row].price
        if let catagory = businessList[indexPath.row].categories {
            if let alias = catagory[0].alias {
                cell.labelCategory.text = alias
            }
        }
        
        Validation.urlToImage(businessList[indexPath.row].imageUrl) { image in
            DispatchQueue.main.async {
                cell.restaurantImageView.image = image
            }
        }
        cell.likeButton.tag = indexPath.row
        cell.contentView.bringSubviewToFront(cell.likeButton)
//        cell.likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell clicked")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    @objc func didTapLikeButton(sender: AnyObject){
//        print("like Clicked for row \(sender.tag)") // This works, every cell returns a different number and in order.
//        // use the tag of button as index
//        let alert = UIAlertController(title: "Subscribed!", message: "Subscribed to \(sender.tag)", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(okAction)
//              
//        self.present(alert, animated: true, completion: nil)
//    }
}
