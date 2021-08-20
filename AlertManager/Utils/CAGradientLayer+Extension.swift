//
//  CAGradientLayer+Extension.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/19.
//

import UIKit

enum GradientDirection {
    case topToBottom, bottomToTop
    case leftToRight, rightToLeft
    case rightBottomToLeftTop
    case leftBottomToRightTop
    var startPoint: CGPoint {
        switch self {
        case .topToBottom:
            return CGPoint(x: 0, y: 0)
        case .bottomToTop:
            return CGPoint(x: 0, y: 1)
        case .leftToRight:
            return CGPoint(x: 0, y: 0)
        case .rightToLeft:
            return CGPoint(x: 1, y: 0)
        case .rightBottomToLeftTop:
            return CGPoint(x: 1, y: 1)
        case .leftBottomToRightTop:
            return CGPoint(x: 0, y: 1)
        }
    }
    
    var endPoint: CGPoint {
        switch self {
        case .topToBottom:
            return CGPoint(x: 0, y: 1)
        case .bottomToTop:
            return CGPoint(x: 0, y: 0)
        case .leftToRight:
            return CGPoint(x: 1, y: 0)
        case .rightToLeft:
            return CGPoint(x: 0, y: 0)
        case .rightBottomToLeftTop:
            return CGPoint(x: 0, y: 0)
        case .leftBottomToRightTop:
            return CGPoint(x: 1, y: 0)
        }
    }
}

