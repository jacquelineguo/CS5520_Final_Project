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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        kolodaView = KolodaView()
        kolodaView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(kolodaView)
        
        NSLayoutConstraint.activate([
            kolodaView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            kolodaView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            kolodaView.widthAnchor.constraint(equalToConstant: 300),  // Assuming a fixed width
            kolodaView.heightAnchor.constraint(equalToConstant: 500)  // Assuming a fixed height
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
