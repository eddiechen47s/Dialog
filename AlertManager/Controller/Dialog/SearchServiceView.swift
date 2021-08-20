//
//  SearchServiceView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/17.
//

import UIKit
import DropDown

class SearchServiceView: UIView {
    private let serviceKeyWordLabel = BaseLabel(text: "服務廠關鍵字", textColor: #colorLiteral(red: 0.3215686275, green: 0.3234777451, blue: 0.3234732151, alpha: 1))
    let serviceKeyWordView = DialogMenuView(placeholder: "請輸入服務廠關鍵字", imageName: "search", imgLeft: true, width: 14.4, height: 14.4)
    private let areaLabel = BaseLabel(text: "所在地區", textColor: #colorLiteral(red: 0.3215686275, green: 0.3234777451, blue: 0.3234732151, alpha: 1))
    let cityView = DialogMenuView(placeholder: "請選擇縣市", imageName: "arrow", isEditing: false)
    let areaView = DialogMenuView(placeholder: "請選擇區域", imageName: "arrow", isEditing: false)
    let menu: DropDown = {
        let menu = DropDown()
        menu.textFont = .systemFont(ofSize: 18)
        menu.backgroundColor = .white
        menu.dataSource = DialogSearchCity.city.value
        return menu
    }()
    init() {
        super.init(frame: .zero)
        setupUI()
        
        let gestureCity = UITapGestureRecognizer(target: self, action: #selector(didTapCityView))
        gestureCity.numberOfTapsRequired = 1
        gestureCity.numberOfTouchesRequired = 1
        cityView.addGestureRecognizer(gestureCity)
        let gestureArea = UITapGestureRecognizer(target: self, action: #selector(didTapAreaView))
        gestureArea.numberOfTapsRequired = 1
        gestureArea.numberOfTouchesRequired = 1
        areaView.addGestureRecognizer(gestureArea)
        
        
    }
    
    private func setupUI() {
        addSubViews(serviceKeyWordLabel, serviceKeyWordView, areaLabel, cityView, areaView)
        
        serviceKeyWordLabel.snp.makeConstraints {
            $0.top.equalTo(snp.top)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(20)
        }
        serviceKeyWordView.snp.makeConstraints {
            $0.top.equalTo(serviceKeyWordLabel.snp.bottom).offset(5)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(50)
        }
        areaLabel.snp.makeConstraints {
            $0.top.equalTo(serviceKeyWordView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(20)
        }
        cityView.snp.makeConstraints {
            $0.top.equalTo(areaLabel.snp.bottom).offset(5)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(50)
        }
        areaView.snp.makeConstraints {
            $0.top.equalTo(cityView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    @objc private func didTapCityView() {
        menu.anchorView = cityView
        menu.bottomOffset = CGPoint(x: 0, y: cityView.bounds.height)
        menu.backgroundColor = .white
        menu.selectionAction = { index, title in
            self.cityView.textField.text = title
        }
        menu.show()
    }
    @objc private func didTapAreaView() {
        menu.anchorView = areaView
        menu.bottomOffset = CGPoint(x: 0, y: areaView.bounds.height)
        menu.backgroundColor = .white
        menu.selectionAction = { index, title in
            self.areaView.textField.text = title
        }
        menu.show()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
