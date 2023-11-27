//
//  Restaurant.swift
//  BiteSight
//
//  Created by Tiffany Zhang on 11/26/23.
//

import Foundation
import UIKit

struct Restaurant {
//    @DocumentID var id: String?
    var name: String
    var address: String
    var zip: String
    var likes: Int
    var photo: UIImage
    var description: String
    
    init(name: String, address: String, zip: String, likes: Int, photo: UIImage, description: String) {
        self.name = name
        self.address = address
        self.zip = zip
        self.likes = likes
        self.photo = photo
        self.description = description
    }
}
