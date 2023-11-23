//
//  ExploreView.swift
//  BiteSight
//
//  Created by (Vincent) GuoWei Li on 11/22/23.
//

import UIKit

class ExploreView: UIView {

    var boxView: UIView!
    var userLocationLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        boxView = UIView()
        boxView.backgroundColor = .green
        boxView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(boxView)
        
        userLocationLabel = UILabel()
        userLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userLocationLabel)
        
        NSLayoutConstraint.activate([
            boxView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            boxView.widthAnchor.constraint(equalToConstant: 200),
            boxView.heightAnchor.constraint(equalToConstant: 200),
            boxView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            userLocationLabel.topAnchor.constraint(equalTo: boxView.bottomAnchor, constant: 20),
            userLocationLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
