//
//  ExploreView.swift
//  BiteSight
//
//  Created by (Vincent) GuoWei Li on 11/22/23.
//

import UIKit
import Koloda

class ExploreView: UIView {

    var kolodaView: KolodaView!
    var dislikeImage: UIImageView!
    var likeImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        kolodaView = KolodaView()
        kolodaView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(kolodaView)
        
        dislikeImage = UIImageView()
        dislikeImage.image = UIImage(named: "dislike")
        dislikeImage.layer.cornerRadius = 50
//        dislikeImage.clipsToBounds = true
        dislikeImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dislikeImage)
        
        likeImage = UIImageView()
        likeImage.image = UIImage(named: "like")
        likeImage.layer.cornerRadius = 30
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(likeImage)
        
        NSLayoutConstraint.activate([
            kolodaView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -50),
            kolodaView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            kolodaView.widthAnchor.constraint(equalToConstant: 360),  // Assuming a fixed width
            kolodaView.heightAnchor.constraint(equalToConstant: 530),  // Assuming a fixed height
            
            dislikeImage.topAnchor.constraint(equalTo: kolodaView.bottomAnchor, constant: 60),
            dislikeImage.leadingAnchor.constraint(equalTo: kolodaView.leadingAnchor, constant: 15),
            dislikeImage.widthAnchor.constraint(equalToConstant: 60),
            dislikeImage.heightAnchor.constraint(equalToConstant: 60),
            
            likeImage.topAnchor.constraint(equalTo: kolodaView.bottomAnchor, constant: 60),
            likeImage.trailingAnchor.constraint(equalTo: kolodaView.trailingAnchor, constant: -15),
            likeImage.widthAnchor.constraint(equalToConstant: 60),
            likeImage.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
