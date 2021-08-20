//
//  BaseDialogViewController.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/23.
//

import UIKit

class BaseDialogViewController: UIViewController {
    
    var backgroundView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.isUserInteractionEnabled = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundView)

        setupDiglog()
    }

    func setupDiglog() { }
    
}
