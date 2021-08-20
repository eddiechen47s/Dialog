//
//  String+Extension.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/9.
//

import UIKit

extension String {
    /// 字體／字體顏色／行間距／字間距
    func attributedString(font: UIFont, textColor: UIColor, lineSpaceing: CGFloat, wordSpaceing: CGFloat, lineHeightMultiple: CGFloat = 1) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = lineHeightMultiple
        style.lineSpacing = lineSpaceing
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font             : font,
            NSAttributedString.Key.foregroundColor  : textColor,
            NSAttributedString.Key.paragraphStyle   : style,
            NSAttributedString.Key.kern             : wordSpaceing,
        ]
        let attrStr = NSMutableAttributedString.init(string: self, attributes: attributes)
        return attrStr
    }
//
//    func attributedStringWithURL(font: UIFont, textColor: UIColor, lineSpaceing: CGFloat, wordSpaceing: CGFloat, link: String, underlineStyle: NSUnderlineStyle = .byWord) -> NSAttributedString {
//        let style = NSMutableParagraphStyle()
//        style.lineSpacing = lineSpaceing
//        let attributes: [NSAttributedString.Key : Any] = [
//            NSAttributedString.Key.font             : font,
//            NSAttributedString.Key.foregroundColor  : textColor,
//            NSAttributedString.Key.paragraphStyle   : style,
//            NSAttributedString.Key.kern             : wordSpaceing,
//            NSAttributedString.Key.link                :link,
//            NSAttributedString.Key.underlineStyle          :underlineStyle
//        ]
//        let attrStr = NSMutableAttributedString.init(string: self, attributes: attributes)
//        return attrStr
//    }
}
