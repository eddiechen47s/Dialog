//
//  CustomCheckBoxView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/5.
//

import UIKit

class CheckBoxView: UIView {
    var id: Int = 0
    let ckeckBoxButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "unCheckbox"), for: .normal)
        button.setImage(UIImage(named: "Checkbox"), for: .selected)

        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    let textLabel = BaseLabel(text: "", textColor: .black, textAlignment: .left, font: .systemFont(ofSize: 15, weight: .regular))
    var isSelected: Bool = false
    var touchEvent: ((Int, Bool) -> Void)?
    
    init(text: String, isSelected: Bool = false, font: UIFont = .systemFont(ofSize: 15, weight: .regular), textColor: UIColor = .black, id: Int = 0) {
        super.init(frame: .zero)
        self.textLabel.text = text
        self.textLabel.textColor = textColor
        self.textLabel.font = font
        self.id = id
        addSubViews(ckeckBoxButton, textLabel)
        ckeckBoxButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(snp.left)
            $0.width.equalTo(20)
            $0.height.equalTo(snp.height)
        }
        textLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(ckeckBoxButton.snp.right).offset(6)
            $0.right.equalTo(snp.right)
            $0.height.equalTo(snp.height)
        }
    
    }
    
    func clearReload(completion: @escaping (() -> Void)) {
        self.isSelected = false
        self.ckeckBoxButton.isSelected = self.isSelected
        completion()
    }
    
    @objc func tapButton() {
        self.isSelected = !self.isSelected
        self.ckeckBoxButton.isSelected = self.isSelected
        if isSelected {
            touchEvent?(self.id, true)
        } else {
            touchEvent?(self.id, false)
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
