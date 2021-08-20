//
//  BiometricsView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/19.
//

import UIKit

class BiometricsView: UIView {
    
    private var logoImageView = BaseImageView(imageName: "touchID", backgroundColor: .clear)
    private let titleLabel = BaseLabel(text: "使用您的指紋登入「和泰Pay」", textColor: UIColor(hexFromString: "313131"), textAlignment: .center, font: UIFont(name: "PingFangTC-Regular", size: 17)!)
    
    init(type: Int) {
        super.init(frame: .zero)
        setupUI()
        switch type {
        case 0:
            logoImageView.image = UIImage(named: "touchID")
        default:
            logoImageView.image = UIImage(named: "FaceID")
        }
    }
    
    private func setupUI() {
        addSubViews(logoImageView, titleLabel)
        logoImageView.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.top.equalTo(snp.top).offset(43.5)
            $0.width.height.equalTo(64)
        }
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(snp.bottom).offset(-20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
