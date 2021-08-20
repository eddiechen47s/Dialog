//
//  GasCompareViewCell.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/6.
//

import UIKit

class GasCompareViewCell: UICollectionViewCell {
    static let identifity = "GasCompareViewCell"
    
    private let gasView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexFromString: "AF3A35")
        return view
    }()
    private let dieselOilView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexFromString: "00657E")
        return view
    }()
    private let gasLabel = BaseLabel(text: "汽油", textColor: .white, textAlignment: .left, font: .systemFont(ofSize: 15, weight: .bold))
    private let gasOilLabel = BaseLabel(text: "0.3 元", textColor: .white, textAlignment: .right, font: .systemFont(ofSize: 15, weight: .bold))
    private let dieselLabel = BaseLabel(text: "柴油", textColor: .white, textAlignment: .left, font: .systemFont(ofSize: 15, weight: .bold))
    private let dieselOilLabel = BaseLabel(text: "0.3 元", textColor: .white, textAlignment: .right, font: .systemFont(ofSize: 15, weight: .bold))
    private let gasUpImg = BaseImageView(imageName: "gasUp", backgroundColor: .white)
    private let gasDownImg = BaseImageView(imageName: "gasDown", backgroundColor: .white)
    private let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
//        gasUpImg.image?.withRenderingMode(.alwaysTemplate)
//        gasUpImg.tintColor = .yellow
    }
    
    private func setupUI() {
        addSubViews(gasView, dieselOilView)
        gasView.addSubViews(gasLabel, gasOilLabel, gasUpImg)
        dieselOilView.addSubViews(dieselLabel, dieselOilLabel, gasDownImg)
        
        gasView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.left.right.equalToSuperview().inset(50)
            $0.height.equalTo(64)
        }
        gasLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(22)
            $0.left.equalTo(gasView.snp.left).offset(20)
            $0.width.equalTo(snp.width).multipliedBy(0.35)
        }
        gasOilLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(22)
            $0.right.equalTo(gasView.snp.right).offset(-20)
            $0.width.equalTo(snp.width).multipliedBy(0.15)
        }
        gasUpImg.snp.makeConstraints {
            $0.centerY.equalTo(gasOilLabel.snp.centerY)
            $0.right.equalTo(gasOilLabel.snp.left).offset(-1)
            $0.width.equalTo(14)
            $0.height.equalTo(27)
        }
        dieselOilView.snp.makeConstraints {
//            $0.bottom.equalToSuperview().offset(-26)
            $0.top.equalTo(gasView.snp.bottom).offset(15)
            $0.left.right.equalToSuperview().inset(50)
            $0.height.equalTo(64)
        }
        dieselLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(22)
            $0.left.equalTo(dieselOilView.snp.left).offset(20)
            $0.width.equalTo(snp.width).multipliedBy(0.35)
        }
        dieselOilLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(22)
            $0.right.equalTo(dieselOilView.snp.right).offset(-20)
            $0.width.equalTo(snp.width).multipliedBy(0.15)
        }
        gasDownImg.snp.makeConstraints {
            $0.centerY.equalTo(dieselOilLabel.snp.centerY)
            $0.right.equalTo(dieselOilLabel.snp.left).offset(-1)
            $0.width.equalTo(14)
            $0.height.equalTo(27)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
