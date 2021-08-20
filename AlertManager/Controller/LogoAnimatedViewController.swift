//
//  LogoAnimatedViewController.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/20.
//

import UIKit

class LogoAnimatedViewController: BaseDialogViewController {
    private let containerView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    private lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.loadGif(name: "Toyota_2")
        return imgView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = .clear
        setupUI()
        dismissToFornt()
    }
    
    private func setupUI() {
        view.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.snp.makeConstraints {
            $0.center.equalTo(view.snp.center)
            $0.width.height.equalTo(100)
        }

        imageView.snp.makeConstraints {
            $0.center.equalTo(containerView.snp.center)
            $0.width.height.equalTo(80)
        }
    }
    
    private func dismissToFornt() {
        let gestureBackground = UITapGestureRecognizer(target: self, action: #selector(stop))
        gestureBackground.numberOfTapsRequired = 1
        gestureBackground.numberOfTouchesRequired = 1
        backgroundView.addGestureRecognizer(gestureBackground)
        backgroundView.isUserInteractionEnabled = true
    }

    @objc func stop() {
        self.dismiss(animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
