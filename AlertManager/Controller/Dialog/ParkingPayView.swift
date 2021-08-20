//
//  ParkingPayView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/6.
//

import UIKit

class ParkingPayView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let prefixStr = "【和泰Pay全新功能 - "
        let infixStr = "停車場付款"
        let suffixStr = "】\n繳費免排隊 直接開出場"
        let prefix = prefixStr.attributedString(font: .systemFont(ofSize: 17, weight: .bold), textColor: .black, lineSpaceing: 6, wordSpaceing: 0)
        let infix = infixStr.attributedString(font: .systemFont(ofSize: 17, weight: .bold), textColor: #colorLiteral(red: 0.8167473078, green: 0.1142069921, blue: 0.1067450568, alpha: 1), lineSpaceing: 6, wordSpaceing: 0)
        let suffix = suffixStr.attributedString(font: .systemFont(ofSize: 17, weight: .bold), textColor: .black, lineSpaceing: 6, wordSpaceing: 0)
        let attributes = NSMutableAttributedString(attributedString: prefix)
        attributes.append(infix)
        attributes.append(suffix)
        label.attributedText = attributes
        label.textAlignment = .center
        return label
    }()
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let prefixStr = "＊免取票嗶卡，車牌辨識進出場\n"
        let infixStr = "＊ 即時掌握當下停車狀態\n"
        let infix_1Str = "＊和泰Pay直接扣款，方便又快速\n"
        let suffixStr = "＊支援全台400+個停車場\n"
        
        let prefix = prefixStr.attributedString(font: .systemFont(ofSize: 15, weight: .regular), textColor: UIColor(hexFromString: "313131"), lineSpaceing: 10, wordSpaceing: 0)
        let infix = infixStr.attributedString(font: .systemFont(ofSize: 15, weight: .regular), textColor: .black, lineSpaceing: 10, wordSpaceing: 0)
        let infix_1 = infix_1Str.attributedString(font: .systemFont(ofSize: 15, weight: .regular), textColor: .black, lineSpaceing: 10, wordSpaceing: 0)
        let suffix = suffixStr.attributedString(font: .systemFont(ofSize: 15, weight: .regular), textColor: .black, lineSpaceing: 10, wordSpaceing: 0)
        let attributes = NSMutableAttributedString(attributedString: prefix)
        attributes.append(infix)
        attributes.append(infix_1)
        attributes.append(suffix)
        label.attributedText = attributes
        label.textAlignment = .left
        return label
    }()
    private let pageFotterLabel = BaseLabel(textColor: UIColor(hexFromString: "313131"), textAlignment: .center, font: .systemFont(ofSize: 13, weight: .regular), attributedText: "本服務由和泰與麻吉雲合作提供", wordSpaceing: 1.1)
    private let infoImageView = BaseImageView(imageName: "Parking", backgroundColor: .clear)
    private let closeButton = BaseButton(title: "不再顯示", titleColor: UIColor(hexFromString: "CC0015"), font: .systemFont(ofSize: 13), backgroundColor: .clear, action: #selector(tapClose), vc: nil, cornerRadius: 10)
    private let openButton = BaseButton(title: "開通服務", titleColor: .white, font: .systemFont(ofSize: 13, weight: .bold), backgroundColor: UIColor(hexFromString: "CC0015"), action: #selector(tapOpen), vc: nil, cornerRadius: 10)
    private let containerView = UIView()

    var close: (() ->Void)!
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    private func setupUI() {
        addSubViews(titleLabel, infoImageView, detailLabel, containerView, closeButton, openButton)
        containerView.addSubview(pageFotterLabel)
        titleLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(60)
        }
        infoImageView.snp.makeConstraints {
            $0.bottom.equalTo(detailLabel.snp.top).offset(-12)
            $0.centerX.equalTo(snp.centerX)
            $0.width.height.equalTo(140)
        }
        detailLabel.snp.makeConstraints {
            $0.bottom.equalTo(pageFotterLabel.snp.top).offset(-15)
            $0.centerX.equalTo(snp.centerX)
            $0.width.equalTo(228)
            $0.height.equalTo(110)
        }
        containerView.snp.makeConstraints {
            $0.top.equalTo(detailLabel.snp.bottom)
            $0.bottom.equalTo(openButton.snp.top)
            $0.width.equalTo(snp.width)
            $0.centerX.equalTo(snp.centerX)
        }
        pageFotterLabel.snp.makeConstraints {
            $0.bottom.equalTo(openButton.snp.top).offset(-35)
            $0.centerX.equalTo(snp.centerX)
            $0.width.equalTo(snp.width)
            $0.height.equalTo(20)
        }
        openButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-26)
            $0.right.equalToSuperview().offset(-20)
            $0.width.equalTo(145)
            $0.height.equalTo(35)
        }
        closeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-26)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(145)
            $0.height.equalTo(35)
        }
    }
    
    // MARK: - Selector
    @objc func tapOpen() {
    }
    @objc func tapClose() {
        close()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
