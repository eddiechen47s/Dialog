//
//  SearchGasStationView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/5.
//

import UIKit

class SearchGasStationView: UIView {
    private let brandLabel = BaseLabel(text: "品牌", textColor: #colorLiteral(red: 0.03529411765, green: 0.06274509804, blue: 0.1137254902, alpha: 1), font: .systemFont(ofSize: 16, weight: .semibold))
    private let timeLabel = BaseLabel(text: "營業時間", textColor: #colorLiteral(red: 0.03529411765, green: 0.06274509804, blue: 0.1137254902, alpha: 1), font: .systemFont(ofSize: 16, weight: .semibold))
    private let saleGasLabel = BaseLabel(text: "販售油品", textColor: #colorLiteral(red: 0.03529411765, green: 0.06274509804, blue: 0.1137254902, alpha: 1), font: .systemFont(ofSize: 16, weight: .semibold))
    private var directlyView = CheckBoxView(text: "中油(直營)", font: .systemFont(ofSize: 16), id: 0)
    private var franchiseeView = CheckBoxView(text: "中油(加盟)", font: .systemFont(ofSize: 16), id: 1)
    private var gas1_View = CheckBoxView(text: "全國", font: .systemFont(ofSize: 16), id: 2)
    private var gas2_View = CheckBoxView(text: "台塑/台亞", font: .systemFont(ofSize: 16), id: 3)
    private var gas3_View = CheckBoxView(text: "福懋", font: .systemFont(ofSize: 16), id: 4)
    private var gas4_View = CheckBoxView(text: "統一", font: .systemFont(ofSize: 16), id: 5)
    private var openedView = CheckBoxView(text: "營業中", font: .systemFont(ofSize: 16), id: 6)
    private var open24_View = CheckBoxView(text: "24小時營業", font: .systemFont(ofSize: 16), id: 7)
    private var gas92_View = CheckBoxView(text: "92無鉛汽油", font: .systemFont(ofSize: 16), id: 8)
    private var gas95_View = CheckBoxView(text: "95無鉛汽油", font: .systemFont(ofSize: 16), id: 9)
    private var gas98_View = CheckBoxView(text: "98無鉛汽油", font: .systemFont(ofSize: 16), id: 10)
    private var dieselFuelView = CheckBoxView(text: "超級柴油", font: .systemFont(ofSize: 16), id: 11)
    private let containerView = UIView()
    private let clearButton = BaseButton(title: "清除全部", titleColor: UIColor(hexFromString: "CC0015"), font: .systemFont(ofSize: 13), backgroundColor: .clear, action: #selector(tapClear), vc: nil, cornerRadius: 17)
    private let searchButton = BaseButton(title: "搜尋", titleColor: .white, font: .systemFont(ofSize: 13, weight: .bold), backgroundColor: UIColor(hexFromString: "CC0015"), action: #selector(tapSearch), vc: nil, cornerRadius: 17)

    lazy var setViewSelected = [directlyView, gas1_View, gas2_View, gas3_View, gas4_View, openedView, open24_View, gas92_View, gas95_View, gas98_View, dieselFuelView]
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
        self.addSubViews(brandLabel, directlyView, franchiseeView, gas1_View, gas2_View, gas3_View, gas4_View, timeLabel, openedView, open24_View, saleGasLabel, gas92_View, gas95_View, gas98_View, dieselFuelView, containerView, clearButton, searchButton)
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(10)
            $0.left.equalTo(snp.left).offset(2)
            $0.right.equalTo(snp.right)
            $0.height.equalTo(24)
        }
        directlyView.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(9)
            $0.left.equalTo(brandLabel.snp.left).offset(1)
            $0.width.equalTo(self.snp.width).multipliedBy(0.48)
            $0.height.equalTo(24)
        }
        gas1_View.snp.makeConstraints {
            $0.top.equalTo(directlyView.snp.bottom).offset(9)
            $0.left.equalTo(brandLabel.snp.left).offset(1)
            $0.width.equalTo(self.snp.width).multipliedBy(0.48)
            $0.height.equalTo(24)
        }
        gas3_View.snp.makeConstraints {
            $0.top.equalTo(gas1_View.snp.bottom).offset(9)
            $0.left.equalTo(brandLabel.snp.left).offset(1)
            $0.width.equalTo(self.snp.width).multipliedBy(0.48)
            $0.height.equalTo(24)
        }
        franchiseeView.snp.makeConstraints {
            $0.top.equalTo(directlyView.snp.top)
            $0.left.equalTo(directlyView.snp.right)
            $0.width.equalTo(self.snp.width).multipliedBy(0.5)
            $0.height.equalTo(24)
        }
        gas2_View.snp.makeConstraints {
            $0.top.equalTo(franchiseeView.snp.bottom).offset(9)
            $0.left.equalTo(gas1_View.snp.right)
            $0.width.equalTo(self.snp.width).multipliedBy(0.48)
            $0.height.equalTo(24)
        }
        gas4_View.snp.makeConstraints {
            $0.top.equalTo(gas2_View.snp.bottom).offset(9)
            $0.left.equalTo(gas1_View.snp.right)
            $0.width.equalTo(self.snp.width).multipliedBy(0.48)
            $0.height.equalTo(24)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(gas4_View.snp.bottom).offset(25)
            $0.left.equalTo(brandLabel.snp.left)
            $0.right.equalTo(snp.right)
            $0.height.equalTo(24)
        }
        openedView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(6)
            $0.left.equalTo(brandLabel.snp.left).offset(1)
            $0.width.equalTo(self.snp.width).multipliedBy(0.48)
            $0.height.equalTo(24)
        }
        open24_View.snp.makeConstraints {
            $0.top.equalTo(openedView.snp.top)
            $0.left.equalTo(openedView.snp.right)
            $0.width.equalTo(self.snp.width).multipliedBy(0.5)
            $0.height.equalTo(24)
        }
        saleGasLabel.snp.makeConstraints {
            $0.top.equalTo(openedView.snp.bottom).offset(25)
            $0.left.equalTo(brandLabel.snp.left)
            $0.right.equalTo(snp.right)
            $0.height.equalTo(24)
        }
        gas92_View.snp.makeConstraints {
            $0.top.equalTo(saleGasLabel.snp.bottom).offset(6)
            $0.left.equalTo(brandLabel.snp.left).offset(1)
            $0.width.equalTo(self.snp.width).multipliedBy(0.48)
            $0.height.equalTo(24)
        }
        gas95_View.snp.makeConstraints {
            $0.top.equalTo(gas92_View.snp.top)
            $0.left.equalTo(gas92_View.snp.right)
            $0.width.equalTo(self.snp.width).multipliedBy(0.5)
            $0.height.equalTo(24)
        }
        gas98_View.snp.makeConstraints {
            $0.top.equalTo(gas92_View.snp.bottom).offset(10)
            $0.left.equalTo(brandLabel.snp.left).offset(1)
            $0.width.equalTo(self.snp.width).multipliedBy(0.48)
            $0.height.equalTo(24)
        }
        dieselFuelView.snp.makeConstraints {
            $0.top.equalTo(gas98_View.snp.top)
            $0.left.equalTo(gas98_View.snp.right)
            $0.width.equalTo(self.snp.width).multipliedBy(0.5)
            $0.height.equalTo(24)
        }
        containerView.snp.makeConstraints {
            $0.top.equalTo(dieselFuelView.snp.bottom)
            $0.left.equalTo(snp.left)
            $0.right.equalTo(snp.right)
            $0.bottom.equalTo(snp.bottom)
        }
        clearButton.snp.makeConstraints {
            $0.centerY.equalTo(containerView.snp.centerY)
            $0.left.equalTo(containerView.snp.left)
            $0.width.equalTo(containerView.snp.width).multipliedBy(0.48)
            $0.height.equalTo(35)
        }
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(containerView.snp.centerY)
            $0.right.equalTo(containerView.snp.right)
            $0.width.equalTo(containerView.snp.width).multipliedBy(0.48)
            $0.height.equalTo(35)
        }
    }
    // MARK: - Selector
    @objc func tapSearch() {
        print("Array:", self.setBoxSelected)

    }
    @objc func tapClear() {
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
