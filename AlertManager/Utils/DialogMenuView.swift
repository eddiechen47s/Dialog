//
//  CustomTextField.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/28.
//

import UIKit

class DialogMenuView: UIView, UITextFieldDelegate {
    let textField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    let imageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .clear
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    init(placeholder: String, imageName: String = "", isEditing: Bool = true, isShowLabel: Bool = false, imgLeft: Bool = false, width: CGFloat = 12, height: CGFloat = 6, backgroundColor: UIColor = .clear, font: UIFont = .systemFont(ofSize: 15)) {
        super.init(frame: .zero)
        if backgroundColor != .clear {
            self.backgroundColor = backgroundColor
            self.textField.backgroundColor = backgroundColor
        }
        
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        textField.delegate = self
        setupUI(imgLeft: imgLeft, width: width, height: height)
        textField.placeholder = placeholder
        textField.font = font
        textField.isEnabled = isEditing
        if imageName != "" {
            imageView.image = UIImage(named: imageName)
        }
    }

    private func setupUI(imgLeft: Bool, width: CGFloat, height: CGFloat) {
        addSubViews(textField, imageView)
        textField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        textField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true

        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        if !imgLeft {
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17).isActive = true
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        } else {
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17).isActive = true
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        }

        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension DialogMenuView {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       self.endEditing(true)
       return true
    }
}
