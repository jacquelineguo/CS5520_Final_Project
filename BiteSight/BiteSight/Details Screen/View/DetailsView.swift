//
//  DetailsView.swift
//  BiteSight
//
//  Created by Tiffany Zhang on 11/26/23.
//

import UIKit

class DetailsView: UIView {
    var labelName: UILabel!
    var imagePhoto: UIImageView!
    
    var labelLocation: UILabel!
    var labelAddress: UILabel!
    var labelCity: UILabel!
    
    var labelPhone: UILabel!
    var labelPhone1: UILabel!
    
    var labelCategory: UILabel!
    var labelCategory1: UILabel!
    
    var labelPrice: UILabel!
    var labelPrice1: UILabel!
    
    var labelRating: UILabel!
    var labelRating1: UILabel!
    
    var buttonDislike: UIButton!
    
    var buttonMap: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelName()
        setupImagePhoto()
        setupLabelLocation()
        setupLabelPhone()
        setupLabelCategory()
        setupLabelPrice()
        setupLabelRating()
        setupButtonDislike()
        
        setupButtonMap()
        
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
    
    func setupImagePhoto() {
        imagePhoto = UIImageView()
//        imagePhoto.image = UIImage(systemName: "person.fill")
        imagePhoto.tintColor = .black
        imagePhoto.contentMode = .scaleAspectFit
        imagePhoto.clipsToBounds = true
//        imagePhoto.layer.cornerRadius = 10
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imagePhoto)
    }
    
    func setupLabelLocation() {
        labelLocation = UILabel()
        labelLocation.text = "Location: "
        labelLocation.font = UIFont.boldSystemFont(ofSize: 16)
        labelLocation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLocation)
        
        labelAddress = UILabel()
        labelAddress.text = ""
        labelAddress.font = UIFont.systemFont(ofSize: 16)
//        labelAddress.numberOfLines = 0
//        labelAddress.lineBreakMode = .byWordWrapping
//        labelLocation1.sizeToFit()
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
        
        labelCity = UILabel()
        labelCity.text = ""
        labelCity.font = UIFont.systemFont(ofSize: 16)
        labelCity.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCity)
    }
    
    func setupLabelPhone() {
        labelPhone = UILabel()
        labelPhone.text = "Phone: "
        labelPhone.font = UIFont.boldSystemFont(ofSize: 16)
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhone)
        
        labelPhone1 = UILabel()
        labelPhone1.text = ""
        labelPhone1.font = UIFont.systemFont(ofSize: 16)
        labelPhone1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhone1)
    }
    
    func setupLabelCategory() {
        labelCategory = UILabel()
        labelCategory.text = "Category: "
        labelCategory.font = UIFont.boldSystemFont(ofSize: 16)
        labelCategory.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCategory)
        
        labelCategory1 = UILabel()
        labelCategory1.text = ""
        labelCategory1.font = UIFont.systemFont(ofSize: 16)
        labelCategory1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCategory1)
    }
    
    func setupLabelPrice() {
        labelPrice = UILabel()
        labelPrice.text = "Price: "
        labelPrice.font = UIFont.boldSystemFont(ofSize: 16)
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPrice)
        
        labelPrice1 = UILabel()
        labelPrice1.text = ""
        labelPrice1.font = UIFont.systemFont(ofSize: 16)
        labelPrice1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPrice1)
    }
    
    func setupLabelRating() {
        labelRating = UILabel()
        labelRating.text = "Rating: "
        labelRating.font = UIFont.boldSystemFont(ofSize: 16)
        labelRating.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelRating)
        
        labelRating1 = UILabel()
        labelRating1.text = ""
        labelRating1.font = UIFont.systemFont(ofSize: 16)
        labelRating1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelRating1)
    }
    
    func setupButtonDislike() {
        buttonDislike = UIButton(type: .system)
        buttonDislike.setTitle("Dislike", for: .normal)
        buttonDislike.setTitleColor(.red, for: .normal)
        buttonDislike.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        buttonDislike.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonDislike)
    }
    
    func setupButtonMap() {
        buttonMap = UIButton(type: .system)
        buttonMap.setTitle("Map", for: .normal)
        buttonMap.setTitleColor(.red, for: .normal)
        buttonMap.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        buttonMap.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonMap)
    }
    
    func initConstraints() {
        let leadingConstant = CGFloat(30)
        let topConstant = CGFloat(20)
        let indentConstant = CGFloat(5)
        NSLayoutConstraint.activate([
            labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelName.topAnchor.constraint(equalTo: self.topAnchor, constant: 170),
            
            imagePhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            imagePhoto.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: topConstant),
            imagePhoto.heightAnchor.constraint(equalToConstant: 150),
//            imagePhoto.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor),
            imagePhoto.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            labelLocation.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelLocation.topAnchor.constraint(equalTo: imagePhoto.bottomAnchor, constant: topConstant),
            
            labelAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelAddress.topAnchor.constraint(equalTo: labelLocation.bottomAnchor, constant: 5),
            labelCity.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelCity.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 5),
            
            labelPhone.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelPhone.topAnchor.constraint(equalTo: labelCity.bottomAnchor, constant: topConstant),
            labelPhone1.leadingAnchor.constraint(equalTo: labelPhone.trailingAnchor, constant: indentConstant),
            labelPhone1.topAnchor.constraint(equalTo: labelCity.bottomAnchor, constant: topConstant),
            
            labelCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelCategory.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: topConstant),
            labelCategory1.leadingAnchor.constraint(equalTo: labelCategory.trailingAnchor, constant: indentConstant),
            labelCategory1.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: topConstant),
            
            labelPrice.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelPrice.topAnchor.constraint(equalTo: labelCategory.bottomAnchor, constant: topConstant),
            labelPrice1.leadingAnchor.constraint(equalTo: labelPrice.trailingAnchor, constant: indentConstant),
            labelPrice1.topAnchor.constraint(equalTo: labelCategory.bottomAnchor, constant: topConstant),
            
            labelRating.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
            labelRating.topAnchor.constraint(equalTo: labelPrice.bottomAnchor, constant: topConstant),
            labelRating1.leadingAnchor.constraint(equalTo: labelRating.trailingAnchor, constant: indentConstant),
            labelRating1.topAnchor.constraint(equalTo: labelPrice.bottomAnchor, constant: topConstant),
            
            buttonDislike.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonDislike.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
            
            buttonMap.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonMap.bottomAnchor.constraint(equalTo: buttonDislike.topAnchor, constant: -50),
            
            
//            labelLocation.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
//            labelLocation.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 20),
//
//            labelAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
//            labelAddress.topAnchor.constraint(equalTo: labelLocation.bottomAnchor, constant: 10),
//
//            labelZip.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
//            labelZip.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 3),
//
//            labelLikes.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
//            labelLikes.topAnchor.constraint(equalTo: labelZip.bottomAnchor, constant: 20),
//
//            imagePhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: topConstant),
//            imagePhoto.heightAnchor.constraint(equalToConstant: 180),
//            imagePhoto.widthAnchor.constraint(equalToConstant: 180),
//            imagePhoto.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//
//            labelDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
//            labelDescription.topAnchor.constraint(equalTo: imagePhoto.bottomAnchor, constant: 50),
//
//            labelDetails.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant),
//            labelDetails.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 10),
//            labelDetails.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100)
            
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
