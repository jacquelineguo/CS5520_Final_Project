//
//  ExploreView.swift
//  BiteSight
//
//  Created by (Vincent) GuoWei Li on 11/22/23.
//

import UIKit

class ExploreView: UIView {

    var boxView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        boxView = UIView()
        boxView.backgroundColor = .green
        boxView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(boxView)
        
        NSLayoutConstraint.activate([
            boxView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            boxView.widthAnchor.constraint(equalToConstant: 200),
            boxView.heightAnchor.constraint(equalToConstant: 200),
            boxView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
