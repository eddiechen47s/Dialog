//
//  GasCompareDetailViewCell.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/6.
//

import UIKit

class GasCompareDetailViewCell: UICollectionViewCell {
    static let identifity = "GasCompareDetailViewCell"
    
    private let gas92_View = BaseView(color: #colorLiteral(red: 0.4117647059, green: 0.7568627451, blue: 0.2862745098, alpha: 1))
    private let gas95_View = BaseView(color: #colorLiteral(red: 0.8156862745, green: 0.3294117647, blue: 0.3294117647, alpha: 1))
    private let gas98_View = BaseView(color: #colorLiteral(red: 0.6156862745, green: 0.3490196078, blue: 0.6039215686, alpha: 1))
    private let gasDiesell_View = BaseView(color: #colorLiteral(red: 0.3490196078, green: 0.3921568627, blue: 0.6156862745, alpha: 1))
    private let title92_Label = BaseLabel(text: "92無鉛", textColor: .white, textAlignment: .left, font: .systemFont(ofSize: 15, weight: .regular))
    private let title95_Label = BaseLabel(text: "95無鉛", textColor: .white, textAlignment: .left, font: .systemFont(ofSize: 15, weight: .regular))
    private let title98_Label = BaseLabel(text: "98無鉛", textColor: .white, textAlignment: .left, font: .systemFont(ofSize: 15, weight: .regular))
    private let titleDiesell_Label = BaseLabel(text: "超級柴油", textColor: .white, textAlignment: .left, font: .systemFont(ofSize: 15, weight: .regular))
    private let value92_Label = BaseLabel(text: "$ 30.4", textColor: .white, textAlignment: .right, font: .systemFont(ofSize: 15, weight: .regular))
    private let value95_Label = BaseLabel(text: "$ 30.4", textColor: .white, textAlignment: .right, font: .systemFont(ofSize: 15, weight: .regular))
    private let value98_Label = BaseLabel(text: "$ 30.4", textColor: .white, textAlignment: .right, font: .systemFont(ofSize: 15, weight: .regular))
    private let valueDiesell_Label = BaseLabel(text: "$ 30.4", textColor: .white, textAlignment: .right, font: .systemFont(ofSize: 15, weight: .regular))
    
    private lazy var gasStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [gas92_View, gas95_View, gas98_View, gasDiesell_View])
        stack.spacing = 6
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        addSubViews(gasStackView)
        gasStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(50)
        }
        gas92_View.addSubViews(title92_Label, value92_Label)
        gas95_View.addSubViews(title95_Label, value95_Label)
        gas98_View.addSubViews(title98_Label, value98_Label)
        gasDiesell_View.addSubViews(titleDiesell_Label, valueDiesell_Label)

        title92_Label.snp.makeConstraints {
            $0.centerY.equalTo(gas92_View.snp.centerY)
            $0.left.equalTo(gas92_View.snp.left).offset(20)
            $0.width.equalTo(gas92_View.snp.width).multipliedBy(0.4)
            $0.height.equalTo(22)
        }
        value92_Label.snp.makeConstraints {
            $0.centerY.equalTo(gas92_View.snp.centerY)
            $0.right.equalTo(gas92_View.snp.right).offset(-14)
            $0.width.equalTo(gas92_View.snp.width).multipliedBy(0.4)
            $0.height.equalTo(22)
        }
        title95_Label.snp.makeConstraints {
            $0.centerY.equalTo(gas95_View.snp.centerY)
            $0.left.equalTo(gas95_View.snp.left).offset(20)
            $0.width.equalTo(gas95_View.snp.width).multipliedBy(0.4)
            $0.height.equalTo(22)
        }
        value95_Label.snp.makeConstraints {
            $0.centerY.equalTo(gas95_View.snp.centerY)
            $0.right.equalTo(gas95_View.snp.right).offset(-14)
            $0.width.equalTo(gas95_View.snp.width).multipliedBy(0.4)
            $0.height.equalTo(22)
        }
        title98_Label.snp.makeConstraints {
            $0.centerY.equalTo(gas98_View.snp.centerY)
            $0.left.equalTo(gas98_View.snp.left).offset(20)
            $0.width.equalTo(gas92_View.snp.width).multipliedBy(0.4)
            $0.height.equalTo(22)
        }
        value98_Label.snp.makeConstraints {
            $0.centerY.equalTo(gas98_View.snp.centerY)
            $0.right.equalTo(gas98_View.snp.right).offset(-14)
            $0.width.equalTo(gas98_View.snp.width).multipliedBy(0.4)
            $0.height.equalTo(22)
        }
        titleDiesell_Label.snp.makeConstraints {
            $0.centerY.equalTo(gasDiesell_View.snp.centerY)
            $0.left.equalTo(gasDiesell_View.snp.left).offset(20)
            $0.width.equalTo(gasDiesell_View.snp.width).multipliedBy(0.4)
            $0.height.equalTo(22)
        }
        valueDiesell_Label.snp.makeConstraints {
            $0.centerY.equalTo(gasDiesell_View.snp.centerY)
            $0.right.equalTo(gasDiesell_View.snp.right).offset(-14)
            $0.width.equalTo(gasDiesell_View.snp.width).multipliedBy(0.4)
            $0.height.equalTo(22)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
