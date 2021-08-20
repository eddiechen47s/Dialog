//
//  MemberQRcodeView.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/28.
//

import UIKit

class MemberQRcodeView: UICollectionViewCell {
    static let identifity = "MemberQRcodeView"
    
    private let qrCodeImageView = BaseImageView(imageName: "", backgroundColor: .clear)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func config(with qrURL: String) {
        qrCodeImageView.image = BarcodeHelper.genDisplayCode(by: qrURL, type: .qr, size: CGSize(width: 100, height: 100))
    }
    
    private func setupUI() {
        let scale = UIScreen.main.bounds.width / 2.2
        addSubViews(qrCodeImageView)
        qrCodeImageView.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.centerY.equalTo(snp.centerY).offset(-5)
            $0.width.height.equalTo(scale)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
