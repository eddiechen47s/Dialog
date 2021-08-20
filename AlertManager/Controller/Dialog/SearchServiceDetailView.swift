//
//  SearchServiceVC.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/5.
//

import UIKit
import DropDown
import SnapKit

class SearchServiceDetailView: UIView {
    private let keyWordLabel = BaseLabel(text: "關鍵字", textColor: #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), font: .systemFont(ofSize: 15, weight: .semibold))
    private let localLabel = BaseLabel(text: "所在地區", textColor: #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), font: .systemFont(ofSize: 15, weight: .semibold))
    private let serviceLabel = BaseLabel(text: "特定服務", textColor: #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), font: .systemFont(ofSize: 16, weight: .semibold))
    private let keyWordView = DialogMenuView(placeholder: "請輸入關鍵字", imageName: "search", imgLeft: true, width: 18, height: 18)
    private let cityView = DialogMenuView(placeholder: "請選擇縣市", imageName: "arrow", isEditing: false)
    private let areaView = DialogMenuView(placeholder: "請選擇區域", imageName: "arrow", isEditing: false, backgroundColor: UIColor(hexFromString: "E7E7E7"))
    private var supraView = CheckBoxView(text: "SUPRA專屬保修服務", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 0)
    private var aedServiceView = CheckBoxView(text: "AED服務", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 1)
    private var earlyFixView = CheckBoxView(text: "早修服務", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 2)
    private var eveningView = CheckBoxView(text: "夜間延長服務", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 3)
    private var metalView = CheckBoxView(text: "板金塗裝", font: UIFont(name: "PingFangTC-Regular", size: 15)!, id: 4)
    private let containerView = UIView()
    private let clearButton = BaseButton(title: "清除全部", titleColor: UIColor(hexFromString: "B5B5B5"), font: .systemFont(ofSize: 15), backgroundColor: .clear, action: #selector(tapClear), vc: nil, cornerRadius: 10)
    private let searchButton = BaseButton(title: "搜尋", titleColor: .white, font: .systemFont(ofSize: 15), backgroundColor: UIColor(hexFromString: "CC0015"), action: #selector(tapSearch), vc: nil, cornerRadius: 10)
    var setBoxSelected: [Int] = []
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.textFont = .systemFont(ofSize: 18)
        menu.backgroundColor = .white
        menu.dataSource = DialogSearchCity.city.value
        return menu
    }()
    private lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.spacing = 6
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        return stack
    }()
    let stackContainerView = UIView()
    var viewHeightConstraint: Constraint!
    lazy var setViewSelected = [supraView, aedServiceView, earlyFixView, eveningView, metalView]

    
    init(isShowAll: Bool = true) {
        super.init(frame: .zero)

        if !isShowAll {
            stackView.addArrangedSubviews([supraView])

            aedServiceView.snp.remakeConstraints {
                $0.top.equalTo(serviceLabel.snp.bottom).offset(8.5)
                $0.left.right.equalTo(keyWordLabel)
                $0.height.equalTo(20)
            }
        } else {
            stackView.addArrangedSubviews([supraView, aedServiceView, earlyFixView, eveningView, metalView])
        }
        setupUI()
        gesture()
        setupEvent()
        keyWordView.textField.returnKeyType = .done
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
        addSubViews(keyWordLabel, keyWordView, localLabel,
                    cityView, areaView, serviceLabel,stackView, containerView, clearButton, searchButton)
        
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
        localLabel.snp.makeConstraints {
            $0.top.equalTo(keyWordView.snp.bottom).offset(19)
            $0.left.right.equalTo(keyWordLabel)
            $0.height.equalTo(20)
        }
        cityView.snp.makeConstraints {
            $0.top.equalTo(localLabel.snp.bottom).offset(5)
            $0.left.right.equalTo(keyWordLabel)
            $0.height.equalTo(45)
        }
        areaView.snp.makeConstraints {
            $0.top.equalTo(cityView.snp.bottom).offset(9)
            $0.left.right.equalTo(keyWordLabel)
            $0.height.equalTo(45)
        }
        serviceLabel.snp.makeConstraints {
            $0.top.equalTo(areaView.snp.bottom).offset(19)
            $0.left.right.equalTo(keyWordLabel)
            $0.height.equalTo(20)
        }
        containerView.snp.makeConstraints {
            $0.bottom.equalTo(snp.bottom).offset(-25)
            $0.height.equalTo(35)
            $0.left.right.equalTo(keyWordLabel)
        }
        clearButton.snp.makeConstraints {
            $0.centerY.equalTo(containerView.snp.centerY)
            $0.left.equalTo(containerView.snp.left)
            $0.width.equalTo(containerView.snp.width).multipliedBy(0.49)
            $0.height.equalTo(35)
        }
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(containerView.snp.centerY)
            $0.right.equalTo(containerView.snp.right)
            $0.width.equalTo(containerView.snp.width).multipliedBy(0.49)
            $0.height.equalTo(35)
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(serviceLabel.snp.bottom).offset(9)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(searchButton.snp.top).offset(-15)
        }
    }
    
    func gesture() {
        let gestureCity = UITapGestureRecognizer(target: self, action: #selector(didTapCityView))
        gestureCity.numberOfTapsRequired = 1
        gestureCity.numberOfTouchesRequired = 1
        cityView.addGestureRecognizer(gestureCity)
        let gestureArea = UITapGestureRecognizer(target: self, action: #selector(didTapAreaView))
        gestureArea.numberOfTapsRequired = 1
        gestureArea.numberOfTouchesRequired = 1
        areaView.addGestureRecognizer(gestureArea)
    }
    
    // MARK: - Selector
    @objc func tapSearch() {
        // to Controller call api
        
    }
    @objc func tapClear() {
        print("tapClear")
        for view in self.setViewSelected {
            view.clearReload {
                self.setBoxSelected.removeAll()
            }
        }
        keyWordView.textField.text = ""
        cityView.textField.text = ""
        areaView.textField.text = ""
        self.areaView.textField.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
        self.areaView.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
    }
    @objc private func didTapCityView() {
        menu.anchorView = cityView
        menu.bottomOffset = CGPoint(x: 0, y: cityView.bounds.height)
        menu.backgroundColor = .white
        menu.selectionAction = { index, title in
            self.cityView.textField.text = title
        }
        menu.show()
        self.endEditing(true)
    }
    @objc private func didTapAreaView() {
        menu.anchorView = areaView
        menu.bottomOffset = CGPoint(x: 0, y: areaView.bounds.height)
        menu.backgroundColor = .white
        menu.selectionAction = { index, title in
            self.areaView.textField.text = title
            if title.count > 0 {
                self.areaView.backgroundColor = .white
                self.areaView.textField.backgroundColor = .white
            }
        }
        menu.show()
        self.endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension UIStackView {
    func addArrangedSubviews(_ views: [UIView?]) {
        views.compactMap({ $0 }).forEach { addArrangedSubview($0) }
    }
    
}

//override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    self.view.endEditing(true)
//}
