//
//  RegisterView.swift
//  BiteSight
//
//  Created by Jacqueline Guo on 11/20/23.
//

import UIKit

class RegisterView: UIView {
    
    var signupLabel: UILabel!
    var selectPhoto: UIButton!
    var labelPhoto: UILabel!
    var nameTextField: UITextField!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var cityTextField: UITextField!
    var stateTextField: UITextField!
    var zipTextField: UITextField!
    var createButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupSignupLabel()
        setupbuttonSelectPhoto()
        setupPhotoLabel()
        setupName()
        setupEmail()
        setupPassword()
        setupCity()
        setupState()
        setupZip()
        setupCreateButton()
        setupConstraints()
    }
    
    func setupSignupLabel() {
        signupLabel = UILabel()
        signupLabel.text = "Tell us a little bit about yourself to create your account"
        signupLabel.lineBreakMode = .byWordWrapping
        signupLabel.numberOfLines = 0
        signupLabel.font = signupLabel.font.withSize(16)
        signupLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(signupLabel)
    }
    
    func setupbuttonSelectPhoto(){
        selectPhoto = UIButton(type: .system)
        selectPhoto.setImage(UIImage(systemName: "camera.circle"), for: .normal)
        selectPhoto.tintColor = .black
        selectPhoto.contentMode = .scaleToFill
        selectPhoto.layer.borderWidth = 1
        selectPhoto.layer.masksToBounds = false
        selectPhoto.layer.borderColor = UIColor.white.cgColor
        selectPhoto.layer.cornerRadius = 120 / 2
        selectPhoto.contentHorizontalAlignment = .fill
        selectPhoto.contentVerticalAlignment = .fill
        selectPhoto.imageView?.contentMode = .scaleAspectFill
        selectPhoto.showsMenuAsPrimaryAction = true
        selectPhoto.translatesAutoresizingMaskIntoConstraints = false
        selectPhoto.clipsToBounds = true
        self.addSubview(selectPhoto)
    }
    
    func setupPhotoLabel() {
        labelPhoto = UILabel()
        labelPhoto.text = "Profile Photo"
        labelPhoto.textColor = .systemGray
        labelPhoto.font = labelPhoto.font.withSize(20)
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoto)
    }
    
    func setupName() {
        nameTextField = UITextField()
        nameTextField.placeholder = "Name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameTextField)
    }
    
    func setupEmail() {
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailTextField)
    }
    
    func setupPassword() {
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordTextField)
    }
    
    func setupCity() {
        cityTextField = UITextField()
        cityTextField.placeholder = "City"
        cityTextField.borderStyle = .roundedRect
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cityTextField)
    }
    
    func setupState() {
        stateTextField = UITextField()
        stateTextField.placeholder = "State"
        stateTextField.borderStyle = .roundedRect
        stateTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stateTextField)
    }
    
    func setupZip() {
        zipTextField = UITextField()
        zipTextField.placeholder = "Zip Code"
        zipTextField.borderStyle = .roundedRect
        zipTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(zipTextField)
    }
    
    func setupCreateButton() {
        createButton = UIButton(type: .system)
        createButton.setTitle("Create", for: .normal)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(createButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            signupLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            signupLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            signupLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            signupLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            selectPhoto.topAnchor.constraint(equalTo: signupLabel.bottomAnchor, constant: 40),
            selectPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            selectPhoto.widthAnchor.constraint(equalToConstant: 120),
            selectPhoto.heightAnchor.constraint(equalToConstant: 120),

            labelPhoto.topAnchor.constraint(equalTo: selectPhoto.bottomAnchor, constant: -4),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 40),
            nameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            nameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            cityTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            cityTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            cityTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            stateTextField.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 20),
            stateTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stateTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            zipTextField.topAnchor.constraint(equalTo: stateTextField.bottomAnchor, constant: 20),
            zipTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            zipTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            createButton.topAnchor.constraint(equalTo: zipTextField.bottomAnchor, constant: 40),
            createButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
