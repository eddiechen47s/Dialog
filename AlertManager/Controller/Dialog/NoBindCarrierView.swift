//
//  NoBindCarrierView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/17.
//

import UIKit

class NoBindCarrierView: UIView, UITextViewDelegate {
    private let invoiceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloudInvioce")
        return imageView
    }()
    
    private let textView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        invoiceImageView.tintColor = .black
        addSubViews(invoiceImageView, textView)
        invoiceImageView.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(17)
            $0.centerX.equalTo(snp.centerX)
            $0.width.equalTo(121.33)
            $0.height.equalTo(129.3)
        }
        textView.snp.makeConstraints {
            $0.top.equalTo(invoiceImageView.snp.bottom).offset(20)
            $0.centerX.equalTo(snp.centerX)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
    }
    
    fileprivate func setupTextView() {
        let prefixStr = "您尚未設定雲端發票載具， 請前往"
        
        let prefixText = prefixStr.attributedString(font: .systemFont(ofSize: 15), textColor: .black, lineSpaceing: 3, wordSpaceing: 0)
        let attributes = NSMutableAttributedString(attributedString: prefixText)

        let invoiceText: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(hexFromString: "CC1C15"),
                                                              .font: UIFont.systemFont(ofSize: 15)  ,
                                                              .link: "https://www.einvoice.nat.gov.tw/APCONSUMER/BTC501W/",
                                                              .underlineStyle:  NSUnderlineStyle.byWord.rawValue]
//
        let suffixText = NSAttributedString(string: "雲端發票載具管理。", attributes: invoiceText)
        attributes.append(suffixText)

        textView.linkTextAttributes = [:]

        textView.attributedText = attributes
        textView.isEditable = false
        textView.isSelectable = true
        textView.delegate = self
        textView.textAlignment = .center
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
    
}
