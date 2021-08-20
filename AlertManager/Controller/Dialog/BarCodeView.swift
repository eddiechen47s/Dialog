//
//  BarCodeView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/17.
//

import UIKit

enum Descriptor: String {
    case code128 = "CICode128BarcodeGenerator"
    case qr = "CIQRCodeGenerator"
}

class BarCodeView: UIView {
    
    private let barcodeImg = UIImageView()
    private let barCodeLabel = BaseLabel(text: "/CBBEGP2", textColor: .black, textAlignment: .center, font: .systemFont(ofSize: 16, weight: .regular))
    
    init() {
        super.init(frame: .zero)
        setupUI()
        barcodeImg.image = BarcodeHelper.genDisplayCode(by: "\(barCodeLabel.text ?? "")", type: .code128, size: CGSize(width: 295, height: 110))
    }
    
    private func setupUI() {
        addSubViews(barcodeImg, barCodeLabel)
        barcodeImg.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.centerY.equalTo(snp.centerY).offset(-20)
            $0.width.equalTo(295)
            $0.height.equalTo(90)
        }
        barCodeLabel.snp.makeConstraints {
            $0.top.equalTo(barcodeImg.snp.bottom)
            $0.centerX.equalTo(snp.centerX)
            $0.width.equalTo(snp.width)
            $0.height.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
