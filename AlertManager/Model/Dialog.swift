//
//  Dialog.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/23.
//

import UIKit

enum DialogType {
    static let width = UIScreen.main.bounds.width * 0.8
    case normal //通用
    case short
    case personalCode //條碼
    case terms //會員條款
    case search
    case barcode
    case noBingingBarCode
    case editCreditCard //編輯信用卡
    case searchService //搜尋服務廠
    case searchGasStation //搜尋加油站
    case gasInfomation //油價資訊
    case parkingPay //停車場付款
    case cctv //即時路況
    case oldCar //認證中古車
    case searchParking //搜尋停車場
    case biometrics(Int) //生物辨識 傳入值: 0(touchID)/ 1(faceID)
    
    var dialogHeight: CGFloat {
        switch self {
        case .normal:
            return UIScreen.main.bounds.height * 0.3
        case .short:
            return UIScreen.main.bounds.height * 0.25
        case .personalCode:
            return scaleScreen(340, scaleSize: 0.8)
        case .terms:
            return scaleScreen(650, scaleSize: 0.85)
        case .search:
            return scaleScreen(380, scaleSize: 0.8)
        case .barcode:
            return UIScreen.main.bounds.height * 0.35
        case .noBingingBarCode:
            return UIScreen.main.bounds.height * 0.46
        case .editCreditCard:
            return scaleScreen(338, scaleSize: 0.8)
        case .searchService:
            return scaleScreen(600, scaleSize: 0.8)
        case .searchGasStation:
            return scaleScreen(476, scaleSize: 0.8)
        case .gasInfomation:
            return scaleScreen(430, scaleSize: 0.8)
        case .parkingPay:
            return scaleScreen(497, scaleSize: 0.8)
        case .cctv:
            return scaleScreen(372, scaleSize: 0.8)
        case .oldCar:
            return scaleScreen(371, scaleSize: 0.8)
        case .searchParking:
            return scaleScreen(478, scaleSize: 0.8)
        case .biometrics:
            return scaleScreen(250, scaleSize: 0.8)
        }
    }
    
    func scaleScreen(_ originalSize: CGFloat, scaleSize: CGFloat) -> CGFloat {
        let boundsHeight = UIScreen.main.bounds.height
        if originalSize > (boundsHeight*scaleSize) {
            return boundsHeight*scaleSize
        } else {
            return originalSize
        }
    }
    
    var isShowContent: Bool {
        switch self {
        case .terms:
            return false
        default:
            return true
        }
    }
    
    var isTextCenter: Bool {
        switch self {
        case .short:
            return true
        default:
            return false
        }
    }
    
    var isShowBarCode: Bool {
        switch self {
        case .personalCode:
            return true
        default:
            return false
        }
    }
    
    var isShowSearch: Bool {
        switch self {
        case .search:
            return true
        default:
            return false
        }
    }
    
}
