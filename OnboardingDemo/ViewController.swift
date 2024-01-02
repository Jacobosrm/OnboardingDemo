//
//  ViewController.swift
//  OnboardingDemo
//
//  Created by Jacobo Ramirez on 30/12/23.
//

import UIKit
import PMSuperButton

class ViewController: UIViewController {
    
    @IBOutlet weak var bienvenidoLabel: UILabel!
    @IBOutlet weak var iniciaSesionLabel: UILabel!
    
    @IBOutlet weak var checkButton: PMSuperButton!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var forgetPasswordLabel: UILabel!
    @IBOutlet weak var loginNormalButton: UIButton!
    @IBOutlet weak var loginGoogleButton: UIButton!
    
    var iconClick = true
    
    //    override func loadView() {
    //        self.view = LoginView()
    //    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // view.backgroundColor = .blue
        setUpUI()
        setGestures()
    }
    
    
    
    @IBAction func loginNormalButtonPressed(_ sender: Any) {
        print("Go to normal login...")
    }
    
    @IBAction func loginGoogleButtonPressed(_ sender: Any) {
        print("Go to google login...")
    }
    
    @IBAction func showPasswordButtonPressed(_ sender: Any) {
        if iconClick == true {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    
    func setUpUI(){
        bienvenidoLabel.font = UIFont(name: "Roboto-Regular", size: 14)
        bienvenidoLabel.textColor = UIColor(hex: "#2D3748")
        
        iniciaSesionLabel.font = UIFont(name: "Roboto-Regular", size: 30)
        iniciaSesionLabel.textColor = UIColor(hex: "#1A202C")
        
        passwordTextField.isSecureTextEntry = true
        
        showPasswordButton.setTitle("", for: .normal)
        checkButton.setTitle("", for: .normal)
        
        loginNormalButton.layer.cornerRadius = 5
        loginGoogleButton.layer.cornerRadius = 5
        loginGoogleButton.layer.masksToBounds = true
        
    }
    
    
    
    func setGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forgetPasswordAction))
            forgetPasswordLabel.isUserInteractionEnabled = true
            forgetPasswordLabel.addGestureRecognizer(tapGesture)
    }
    
    
    
    @objc func forgetPasswordAction() {
        print("Redirigir a ...")
    }
    
}



extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
