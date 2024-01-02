//
//  CheckboxView.swift
//  OnboardingDemo
//
//  Created by Jacobo Ramirez on 30/12/23.
//

import Foundation
import UIKit
import PMSuperButton

class CheckboxView: UIView {
    
    private var checked: Bool = false {
        didSet {
            let imageName = checked ? "checkmark.square.fill" : "square"
            let checkedImage = UIImage(systemName: imageName)
            checkboxButton.setImage(checkedImage, for: .normal)
        }
    }
    
    private lazy var checkboxButton: PMSuperButton = {
        let button = PMSuperButton(type: .detailDisclosure)
        button.translatesAutoresizingMaskIntoConstraints = false
        
//        button.layer.borderColor = UIColor.purple.cgColor
        button.tintColor = .purple
        
        let uncheckedImage = UIImage(systemName: "square")
        button.setImage(uncheckedImage, for: .normal)
        button.addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private let checkboxLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recordar correo"
        return label
    }()
    
    var isChecked: Bool {
        return checked
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(checkboxButton)
        addSubview(checkboxLabel)
        
        NSLayoutConstraint.activate([
            checkboxButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkboxButton.topAnchor.constraint(equalTo: topAnchor),
            checkboxButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            checkboxButton.widthAnchor.constraint(equalToConstant: 30),
            
            checkboxLabel.leadingAnchor.constraint(equalTo: checkboxButton.trailingAnchor, constant: 8),
            checkboxLabel.topAnchor.constraint(equalTo: topAnchor),
            checkboxLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            checkboxLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    @objc private func checkboxTapped(_ sender: PMSuperButton) {
        checked = !checked
    }
}
