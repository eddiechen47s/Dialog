//
//  EditCreditCardView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/17.
//

import UIKit

class EditCreditCardView: UIView {
    var isDefaultCard: Bool = false //for 編輯信用卡頁

    let creditCardView = DialogMenuView(placeholder: "請輸入信用卡", imageName: "", isEditing: true)

    private let editCardTtitleLabel = BaseLabel(text: "信用卡名稱", textColor: UIColor.init(hexFromString: "7B7B7B"), font: .systemFont(ofSize: 15, weight: .regular))
    private let issuingBankLabel = BaseLabel(text: "發卡銀行", textColor:#colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), font: .systemFont(ofSize: 13, weight: .regular))
    private let cardNumberLabel = BaseLabel(text: "信用卡卡號", textColor:#colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), font: .systemFont(ofSize: 13, weight: .regular))
    private let bankLabel = BaseLabel(textColor: #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1), font: .systemFont(ofSize: 15, weight: .regular))
    private let numberLabel = BaseLabel(textColor: #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1), font: .systemFont(ofSize: 15, weight: .regular))
    private let ckeckBoxLabel = BaseLabel(text: "設為預設信用卡",textColor: #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1), font: .systemFont(ofSize: 15, weight: .regular))
    
    private lazy var checkBoxButton = BaseImgButton(imgName: "unCheckbox", action: #selector(didTapCheck))
    
    private lazy var cardsLeftStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [issuingBankLabel, cardNumberLabel])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    private lazy var cardsRightStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [bankLabel, numberLabel])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private lazy var editCardStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [deleteCardButton, storedButton])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private lazy var storedButton = BaseButton(title: "儲存", titleColor: .white, font: .systemFont(ofSize: 13), backgroundColor: UIColor(hexFromString: "CC1C15"), action: #selector(didTapstored), cornerRadius: 10)
    private lazy var deleteCardButton = BaseButton(title: "刪除信用卡", titleColor: #colorLiteral(red: 0.8156862745, green: 0.007843137255, blue: 0.1058823529, alpha: 1), font: .systemFont(ofSize: 13), backgroundColor: .white, action: #selector(didTapDelete), borderWidth: 1, borderColor: #colorLiteral(red: 0.8, green: 0.1098039216, blue: 0.08235294118, alpha: 1), cornerRadius: 10)
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    func config(bank: String, CarNum: String) {
        self.bankLabel.text = bank
        self.numberLabel.text = CarNum
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let scaleView = UIView()
        
        addSubViews(editCardTtitleLabel,
                    creditCardView,
                    cardsLeftStackView,
                    cardsRightStackView,
                    editCardStackView,
                    scaleView,
                    checkBoxButton,
                    ckeckBoxLabel
        )
        editCardTtitleLabel.snp.makeConstraints {
            $0.top.equalTo(snp.top)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(20)
        }
        creditCardView.snp.makeConstraints {
            $0.top.equalTo(editCardTtitleLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(snp.centerX)
            $0.width.equalTo(editCardTtitleLabel.snp.width)
            $0.height.equalTo(45)
        }
        cardsLeftStackView.snp.makeConstraints {
            $0.top.equalTo(creditCardView.snp.bottom).offset(20)
            $0.left.equalTo(creditCardView.snp.left)
            $0.width.equalTo(snp.width).multipliedBy(0.3)
            $0.height.equalTo(50)
        }
        cardsRightStackView.snp.makeConstraints {
            $0.top.equalTo(creditCardView.snp.bottom).offset(20)
            $0.left.equalTo(cardsLeftStackView.snp.right).offset(20)
            $0.width.equalTo(snp.width).multipliedBy(0.7)
            $0.height.equalTo(snp.height).multipliedBy(0.2)
        }

        editCardStackView.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.bottom.equalTo(snp.bottom).offset(-20)
            $0.width.equalTo(creditCardView.snp.width)
            $0.height.equalTo(35)
        }
        scaleView.snp.makeConstraints {
            $0.top.equalTo(cardsRightStackView.snp.bottom)
            $0.bottom.equalTo(editCardStackView.snp.top).offset(-3)
            $0.left.equalTo(creditCardView.snp.left)
            $0.right.equalTo(snp.right)
        }
        checkBoxButton.snp.makeConstraints {
            $0.centerY.equalTo(scaleView.snp.centerY)
            $0.left.equalTo(scaleView.snp.left)
            $0.width.height.equalTo(18)
        }
        ckeckBoxLabel.snp.makeConstraints {
            $0.centerY.equalTo(checkBoxButton.snp.centerY)
            $0.left.equalTo(checkBoxButton.snp.right).offset(6)
            $0.width.equalTo(snp.width).multipliedBy(0.6)
            $0.height.equalTo(checkBoxButton.snp.height)
        }
//        scaleView.backgroundColor = .yellow
    }
    
    @objc private func didTapCheck() {
        print("設為預設信用卡")
        if isDefaultCard {
            self.checkBoxButton.setImage(UIImage(named: "unCheckbox"), for: .normal)
        } else {
            self.checkBoxButton.setImage(UIImage(named: "Checkbox"), for: .normal)
        }
        isDefaultCard = !isDefaultCard
    }
    
    @objc private func didTapstored() {
        print("儲存")
    }
    @objc private func didTapDelete() {
        print("刪除信用卡")
    }
    

    
}
