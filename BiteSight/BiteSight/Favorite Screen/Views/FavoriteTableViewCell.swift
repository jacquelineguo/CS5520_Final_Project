//
//  FavoriteTableViewCell.swift
//  BiteSight
//
//  Created by Tiffany Zhang on 11/26/23.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var imagePhoto: UIImageView!
    var labelName: UILabel!
    var labelDescription: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupImagePhoto()
        setupLabelName()
        setupLabelDescription()
        
        initConstraints()
    }
    
    func setupWrapperCellView() {
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 4.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 1.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupImagePhoto() {
        imagePhoto = UIImageView()
//        imagePhoto.image = UIImage(systemName: "person.fill")
        imagePhoto.tintColor = .black
        imagePhoto.contentMode = .scaleToFill
        imagePhoto.clipsToBounds = true
        imagePhoto.layer.cornerRadius = 10
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imagePhoto)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 16)
        labelName.numberOfLines = 0
        labelName.lineBreakMode = .byWordWrapping
        labelName.sizeToFit()
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelDescription() {
        labelDescription = UILabel()
        labelDescription.font = UIFont.boldSystemFont(ofSize: 16)
        labelDescription.numberOfLines = 0
        labelDescription.lineBreakMode = .byWordWrapping
        labelDescription.sizeToFit()
        
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDescription)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            wrapperCellView.heightAnchor.constraint(equalToConstant: 102),
            
            imagePhoto.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor),
            imagePhoto.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -30),
            imagePhoto.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -30),
            
            labelName.leadingAnchor.constraint(equalTo: imagePhoto.trailingAnchor, constant: 12),
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 12),
            
            labelDescription.leadingAnchor.constraint(equalTo: imagePhoto.trailingAnchor, constant: 12),
            labelDescription.topAnchor.constraint(equalTo: labelName.topAnchor, constant: 12),
            
//            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 12),
//            labelName.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 12),
//            labelName.heightAnchor.constraint(equalToConstant: 30),
//
//            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
//            labelEmail.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 12),
//            labelEmail.heightAnchor.constraint(equalToConstant: 20),
//
//            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
//            labelPhone.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 12),
//            labelPhone.heightAnchor.constraint(equalToConstant: 20),
//
//            imageProfile.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
//            imageProfile.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
//            imageProfile.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -30),
//            imageProfile.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -30),
            
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
