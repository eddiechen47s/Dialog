//
//  BaseImageView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/2.
//

import UIKit

class BaseImageView: UIImageView {
    
    init(imageName: String = "" , backgroundColor: UIColor = .clear) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        if imageName != "" {
            self.image = UIImage(named: imageName)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
