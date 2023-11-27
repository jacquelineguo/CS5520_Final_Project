//
//  DetailsView.swift
//  BiteSight
//
//  Created by Tiffany Zhang on 11/26/23.
//

import UIKit

class DetailsView: UIView {
    var labelName: UILabel!
    var labelLocation: UILabel!
    var labelAddress: UILabel!
    var labelZip: UILabel!
    var labelLikes: UILabel!
    var imagePhoto: UIImageView!
    var labelDescription: UILabel!
    var labelDetails: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelName()
        setupLabelLocation()
        setupLabelAddress()
        setupLabelZip()
        setupLabelLikes()
        setupImagePhoto()
        setupLabelDescription()
        setupLabelDetails()
        
        initConstraints()
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 20)
        labelName.numberOfLines = 0
        labelName.lineBreakMode = .byWordWrapping
        labelName.sizeToFit()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelLocation() {
        labelLocation = UILabel()
        labelLocation.text = "Location: "
        labelLocation.font = UIFont.boldSystemFont(ofSize: 16)
//        labelLocation.numberOfLines = 0
//        labelLocation.lineBreakMode = .byWordWrapping
//        labelLocation.sizeToFit()
        labelLocation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLocation)
    }
    
    func setupLabelAddress() {
        labelAddress = UILabel()
        labelAddress.font = UIFont.systemFont(ofSize: 16)
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
    }
    
    func setupLabelZip() {
        labelZip = UILabel()
        labelZip.font = UIFont.systemFont(ofSize: 16)
        labelZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelZip)
    }
    
    func setupLabelLikes() {
        labelLikes = UILabel()
        labelLikes.font = UIFont.boldSystemFont(ofSize: 16)
        labelLikes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLikes)
    }
    
    func setupImagePhoto() {
        imagePhoto = UIImageView()
//        imagePhoto.image = UIImage(systemName: "person.fill")
        imagePhoto.tintColor = .black
        imagePhoto.contentMode = .scaleToFill
        imagePhoto.clipsToBounds = true
        imagePhoto.layer.cornerRadius = 10
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imagePhoto)
    }
    
    func setupLabelDescription() {
        labelDescription = UILabel()
        labelDescription.text = "Description: "
        labelDescription.font = UIFont.boldSystemFont(ofSize: 16)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDescription)
    }
    
    func setupLabelDetails() {
        labelDetails = UILabel()
        labelDetails.font = UIFont.systemFont(ofSize: 16)
        labelDetails.numberOfLines = 0
        labelDetails.lineBreakMode = .byWordWrapping
        labelDetails.sizeToFit()
        labelDetails.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDetails)
    }
    
    func initConstraints() {
        let leadingConstant = CGFloat(30)
        let topConstant = CGFloat(170)
        NSLayoutConstraint.activate([
            labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelName.topAnchor.constraint(equalTo: self.topAnchor, constant: topConstant),
            
            labelLocation.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelLocation.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 20),
            
            labelAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelAddress.topAnchor.constraint(equalTo: labelLocation.bottomAnchor, constant: 10),
            
            labelZip.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelZip.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 3),
            
            labelLikes.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelLikes.topAnchor.constraint(equalTo: labelZip.bottomAnchor, constant: 20),
            
            imagePhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: topConstant),
            imagePhoto.heightAnchor.constraint(equalToConstant: 180),
            imagePhoto.widthAnchor.constraint(equalToConstant: 180),
            imagePhoto.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            labelDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelDescription.topAnchor.constraint(equalTo: imagePhoto.bottomAnchor, constant: 50),
            
            labelDetails.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelDetails.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 10),
            labelDetails.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100)
            
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
