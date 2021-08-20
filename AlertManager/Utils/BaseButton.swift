//
//  BaseButton.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/4.
//

import UIKit

class BaseButton: UIButton {
    
    init(title: String, titleColor: UIColor, font: UIFont, backgroundColor: UIColor, action: Selector?, vc: UIViewController? = nil, borderWidth: CGFloat = 0, borderColor: CGColor = UIColor.clear.cgColor, cornerRadius: CGFloat = 0) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = font
        self.addTarget(vc, action: action ?? #selector(inits), for: .touchUpInside)
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
    
    @objc func inits() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
