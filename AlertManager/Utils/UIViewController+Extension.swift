//
//  UIViewController+Extension.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/17.
//

import UIKit

extension UIViewController {
    
    //轉場動畫
    func presentAnimation(vc: UIViewController) {
        let animation = CATransition()
        animation.duration = 0.2
        animation.type = .fade
        animation.subtype = .fromBottom
        view.window?.layer.add(animation, forKey: kCATransition)
        self.present(vc, animated: false, completion: nil)
    }
    
}
