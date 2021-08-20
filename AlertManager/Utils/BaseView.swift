//
//  BaseView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/6.
//

import UIKit

class BaseView: UIView {
    
    init(color: UIColor, cornerRadius: CGFloat = 1) {
        super.init(frame: .zero)
        self.backgroundColor = color
        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
