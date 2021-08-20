//
//  SearchParkingView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/19.
//

import UIKit

class SearchParkingView: UIView {
    private let keyWordLabel = BaseLabel(textColor: #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), font: UIFont(name: "PingFangTC-Regular", size: 15)!, attributedText: "地址搜尋", lineHeightMultiple: 0.95)
    private let brandLabel = BaseLabel(text: "品牌", textColor: #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), font: UIFont(name: "PingFangTC-Regular", size: 15)!, attributedText: "品牌", lineHeightMultiple: 0.95)
    private let serviceLabel = BaseLabel(textColor: #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), font: UIFont(name: "PingFangTC-Regular", size: 15)!, attributedText: "特定服務", lineHeightMultiple: 0.95)

    private let keyWordView = DialogMenuView(placeholder: "e.g. 台北市信義路五段", imageName: "search", imgLeft: true, width: 18, height: 18)
    private var parkingView_0 = CheckBoxView(text: "嘟嘟房", font: UIFont(name: "PingFangTC-Regular", size: 15)!, textColor: #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1), id: 0)
    private var parkingView_1 = CheckBoxView(text: "俥亭", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 1)
    private var parkingView_2 = CheckBoxView(text: "永固", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 2)
    private var parkingView_3 = CheckBoxView(text: "和雲", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 3)
    private var parkingView_4 = CheckBoxView(text: "公有", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 4)
    private var parkingView_5 = CheckBoxView(text: "台灣聯通", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 5)
    private var parkingView_6 = CheckBoxView(text: "應安", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 6)
    private var parkingView_7 = CheckBoxView(text: "Times24", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 7)
    private var parkingView_8 = CheckBoxView(text: "詮營", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 8)
    private var hetaiPay_View = CheckBoxView(text: "和泰Pay支付", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 9)
    private let clearButton = BaseButton(title: "清除全部", titleColor: UIColor(hexFromString: "B5B5B5"), font: .systemFont(ofSize: 15), backgroundColor: .clear, action: #selector(tapClear), vc: nil, cornerRadius: 10)
    private let searchButton = BaseButton(title: "搜尋", titleColor: .white, font: .systemFont(ofSize: 15), backgroundColor: UIColor(hexFromString: "CC0015"), action: #selector(tapSearch), vc: nil, cornerRadius: 10)
    
    private lazy var stackView_Left: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [parkingView_0,
                                                  parkingView_1,
                                                  parkingView_2,
                                                  parkingView_3,
                                                  parkingView_4])
        stack.spacing = 5
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.axis = .vertical
        return stack
    }()
    private lazy var stackView_Right: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [parkingView_5,
                                                  parkingView_6,
                                                  parkingView_7,
                                                  parkingView_8])
        stack.spacing = 5
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.axis = .vertical
        return stack
    }()
    
    lazy var setViewSelected = [parkingView_0, parkingView_1, parkingView_2, parkingView_3, parkingView_4, parkingView_5, parkingView_6, parkingView_7, parkingView_8, hetaiPay_View]
    var setBoxSelected: [Int] = []

    init() {
        super.init(frame: .zero)
        setupUI()
        setupEvent()
    }
    
    // MARK: - Helpers
    private func setupEvent() {
        for view in self.setViewSelected {
            view.touchEvent = { [weak self] id, isSelected in
                if !isSelected {
                    if let index = self?.setBoxSelected.firstIndex(of: id) {
                        self?.setBoxSelected.remove(at: index)
                    }
                } else {
                    self?.setBoxSelected.append(id)
                }
            }
        }
    }
    
    private func setupUI() {
        addSubViews(keyWordLabel,
                    keyWordView,
                    brandLabel,
                    stackView_Left,
                    stackView_Right,
                    serviceLabel,
                    hetaiPay_View,
                    clearButton,
                    searchButton
                    )
        keyWordLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.left.equalTo(snp.left)
            $0.right.equalTo(snp.right)
            $0.height.equalTo(20)
        }
        keyWordView.snp.makeConstraints {
            $0.top.equalTo(keyWordLabel.snp.bottom).offset(5)
            $0.left.right.equalTo(keyWordLabel)
            $0.height.equalTo(45)
        }
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(keyWordView.snp.bottom).offset(19)
            $0.left.right.equalTo(keyWordLabel)
            $0.height.equalTo(20)
        }
        stackView_Left.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(6)
            $0.left.equalTo(brandLabel.snp.left)
            $0.width.equalTo(snp.width).multipliedBy(0.5)
            $0.height.equalTo(150)
        }
        stackView_Right.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(6)
            $0.left.equalTo(snp.centerX)
            $0.width.equalTo(snp.width).multipliedBy(0.5)
            $0.height.equalTo(120)
        }
        serviceLabel.snp.makeConstraints {
            $0.top.equalTo(stackView_Left.snp.bottom).offset(20)
            $0.left.right.equalTo(keyWordLabel)
            $0.height.equalTo(20)
        }
        hetaiPay_View.snp.makeConstraints {
            $0.top.equalTo(serviceLabel.snp.bottom).offset(5)
            $0.left.equalTo(brandLabel.snp.left)
            $0.width.equalTo(snp.width).multipliedBy(0.5)
            $0.height.equalTo(25)
        }
        clearButton.snp.makeConstraints {
            $0.bottom.equalTo(snp.bottom).offset(-25)
            $0.left.equalTo(snp.left)
            $0.width.equalTo(snp.width).multipliedBy(0.49)
            $0.height.equalTo(35)
        }
        searchButton.snp.makeConstraints {
            $0.bottom.equalTo(clearButton.snp.bottom)
            $0.right.equalTo(snp.right)
            $0.width.equalTo(snp.width).multipliedBy(0.49)
            $0.height.equalTo(35)
        }
    }
    
    // MARK: - Selector
    @objc func tapSearch() {
        // to Controller call api
        print("Array:", self.setBoxSelected)

    }
    @objc func tapClear() {
        keyWordView.textField.text = ""
        for view in self.setViewSelected {
            view.clearReload {
                self.setBoxSelected.removeAll()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
