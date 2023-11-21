//
//  RegisterView.swift
//  BiteSight
//
//  Created by Jacqueline Guo on 11/20/23.
//

import UIKit

class RegisterView: UIView {
    
    var signupLabel: UILabel!
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
            
            nameTextField.topAnchor.constraint(equalTo: signupLabel.bottomAnchor, constant: 40),
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
