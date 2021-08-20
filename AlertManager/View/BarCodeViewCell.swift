//
//  barCode.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/28.
//

import UIKit

class BarCodeViewCell: UICollectionViewCell {
    static let identifity = "BarCodeViewCell"
    
    private let barCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "barCode")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews(barCodeImageView)
        barCodeImageView.snp.makeConstraints {
            $0.center.equalTo(snp.center)
            $0.width.equalTo(snp.width).multipliedBy(0.9)
            $0.height.equalToSuperview().multipliedBy(0.33)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

