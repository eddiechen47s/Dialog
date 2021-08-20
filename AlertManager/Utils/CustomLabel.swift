//
//  BaseLabel.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/26.
//

import UIKit

enum VerticalAlignment {
    case Top
    case Middle
    case Bottom
}

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        self.verticalAlignment = .Middle
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.verticalAlignment = .Middle
        super.init(coder: aDecoder)
    }
    
    var verticalAlignment: VerticalAlignment {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        switch self.verticalAlignment {
        case .Top:
            textRect.origin.y = bounds.origin.y
        case .Bottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height
        case .Middle:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0
        }
        return textRect
    }
    
    override func drawText(in rect: CGRect) {
        let actualRect = self.textRect(forBounds: rect, limitedToNumberOfLines: numberOfLines)
        super.drawText(in: actualRect)
    }
}
