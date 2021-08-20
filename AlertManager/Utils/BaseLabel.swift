//
//  BaseLabel.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/26.
//

import UIKit

class BaseLabel: UILabel {
    
    init(text: String = "", textColor: UIColor, textAlignment: NSTextAlignment = .left, font: UIFont = .systemFont(ofSize: 14), attributedText: String = "", lineSpaceing: CGFloat = 0, wordSpaceing: CGFloat = 0, lineHeightMultiple: CGFloat = 1) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
        if attributedText != "" {
           let attributedTexts = attributedText.attributedString(font: font, textColor: textColor, lineSpaceing: lineSpaceing, wordSpaceing: wordSpaceing, lineHeightMultiple: lineHeightMultiple)
            self.attributedText = attributedTexts
        }
        self.textAlignment = textAlignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
