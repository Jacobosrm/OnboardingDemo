//
//  LoginView.swift
//  OnboardingDemo
//
//  Created by Jacobo Ramirez on 30/12/23.
//

import Foundation
import UIKit
import PMSuperButton

final class LoginView: UIView{
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bienvenido"
        return label
    }()
    
    private let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Inicia sesión"
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Correo electrónico"
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50.0).isActive = true // Ajusta la altura
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Contraseña"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        // Crear el botón de ojo y asignarlo como rightView del passwordTextField
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        eyeButton.tintColor = .gray
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        // Asignar el botón de ojo como rightView
        textField.rightView = eyeButton
        textField.rightViewMode = .always
        
        return textField
    }()
    
    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "¿Olvidaste tu contraseña?"
        label.textColor = UIColor.purple
        label.isUserInteractionEnabled = true
        
        
        return label
    }()
    
    // CheckButton Section
    private lazy var loginNormalButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ingresar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 5.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.addTarget(self, action: #selector(loginNormalButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginGoogleButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ingresar con Google", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 51/255, blue: 102/255, alpha: 1.0) // Color azul oscuro personalizado
        button.layer.cornerRadius = 5.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(red: 0, green: 51/255, blue: 102/255, alpha: 1.0).cgColor // Borde del mismo color
        button.addTarget(self, action: #selector(loginGoogleButtonTapped), for: .touchUpInside)
        
        if let googleIconImage = UIImage(named: "ico_google") {
            let scaledIcon = googleIconImage.withRenderingMode(.alwaysOriginal)
            let iconSize = CGSize(width: 20, height: 20)
            UIGraphicsBeginImageContextWithOptions(iconSize, false, 0.0)
            scaledIcon.draw(in: CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height))
            let resizedIcon = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
            UIGraphicsEndImageContext()
            
            button.setImage(resizedIcon, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        }
        
        return button
    }()
    
    private let rememberEmailCheckbox: CheckboxView = {
        let checkboxView = CheckboxView()
        checkboxView.translatesAutoresizingMaskIntoConstraints = false
        return checkboxView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup(){
        addSubViews()
        configureConstraints()
    }
    
    private func addSubViews(){
        addSubview(welcomeLabel)
        addSubview(loginTitleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(forgotPasswordLabel)
        addSubview(rememberEmailCheckbox)
        addSubview(loginNormalButton)
        addSubview(loginGoogleButton)
        addSubview(rememberEmailCheckbox)
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            loginTitleLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 2),
            loginTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            emailTextField.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            forgotPasswordLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            //
            rememberEmailCheckbox.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 10),
            rememberEmailCheckbox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rememberEmailCheckbox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            //
            
            loginNormalButton.topAnchor.constraint(equalTo: rememberEmailCheckbox.bottomAnchor, constant: 30),
            loginNormalButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            loginNormalButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            loginNormalButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginGoogleButton.topAnchor.constraint(equalTo: loginNormalButton.bottomAnchor, constant: 20),
            loginGoogleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            loginGoogleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            loginGoogleButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            
        ])
        
        // tapGestures
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped))
        forgotPasswordLabel.addGestureRecognizer(tapGesture)
        
    }
    
    
    
    @objc func forgotPasswordTapped() {
        print("Go to resetPass")
    }
    
    @objc func loginNormalButtonTapped() {
        print("Login...")
    }
    
    @objc func loginGoogleButtonTapped() {
        print("Login with google...")
    }
    
    @objc func togglePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let eyeButton = sender
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.fill"
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc func rememberEmailCheckboxTapped(_ sender: PMSuperButton) {
        sender.isSelected = !sender.isSelected
        let imageName = sender.isSelected ? "checkmark.square.fill" : "square"
        let checkedImage = UIImage(systemName: imageName)
        sender.setImage(checkedImage, for: .normal)
    }
    
}
