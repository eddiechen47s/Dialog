//
//  BaseImageButton.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/4.
//

import UIKit

class BaseImgButton: UIButton {
    
    init(imgName: String = "", action: Selector, vc: UIViewController? = nil) {
        super.init(frame: .zero)
        let image: UIImage = UIImage(named: imgName) ?? UIImage()
        self.setImage(image, for: .normal)
        self.addTarget(vc, action: action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
