//
//  ViewController.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let textButton: UIButton = {
        let button = UIButton()
        button.setTitle("純文字", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapOnlyText), for: .touchUpInside)
        return button
    }()
    
    let noramlButton: UIButton = {
        let button = UIButton()
        button.setTitle("常用", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapNoraml), for: .touchUpInside)
        return button
    }()
    
    let memberButton: UIButton = {
        let button = UIButton()
        button.setTitle("terms", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapMember), for: .touchUpInside)
        return button
    }()
    
    let barCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("條碼", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapPersonalCode), for: .touchUpInside)
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("搜尋", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapSearch), for: .touchUpInside)
        return button
    }()
    
    let barButton: UIButton = {
        let button = UIButton()
        button.setTitle("純載具條碼", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapBarCode), for: .touchUpInside)
        return button
    }()
    
    let noBingingBarButton: UIButton = {
        let button = UIButton()
        button.setTitle("無載具條碼", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapNobinding), for: .touchUpInside)
        return button
    }()
    
    let editCreditCardButton: UIButton = {
        let button = UIButton()
        button.setTitle("編輯信用卡", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapEditing), for: .touchUpInside)
        return button
    }()
    
    lazy var searchService = BaseButton(title: "搜尋服務廠", titleColor: .white, font: .systemFont(ofSize: 14), backgroundColor: .black, action: #selector(tapService), vc: self)
    lazy var gasStation = BaseButton(title: "搜尋加油站", titleColor: .white, font: .systemFont(ofSize: 14), backgroundColor: .black, action: #selector(tapGasStation), vc: self)
    lazy var gasInfomation = BaseButton(title: "油價資訊", titleColor: .white, font: .systemFont(ofSize: 14), backgroundColor: .black, action: #selector(tapGasInfo), vc: self)
    lazy var parkingPay = BaseButton(title: "停車場付款", titleColor: .white, font: .systemFont(ofSize: 14), backgroundColor: .black, action: #selector(tapParkingPay), vc: self)
    lazy var cctv = BaseButton(title: "即時路況", titleColor: .white, font: .systemFont(ofSize: 14), backgroundColor: .black, action: #selector(tapCCTV), vc: self)
    lazy var oldCarBtn = BaseButton(title: "認證中古車", titleColor: .white, font: .systemFont(ofSize: 14), backgroundColor: .black, action: #selector(tapOldCar), vc: self)
    lazy var searchParkingBtn = BaseButton(title: "搜尋停車場", titleColor: .white, font: .systemFont(ofSize: 14), backgroundColor: .black, action: #selector(tapParking), vc: self)
    lazy var touchIDBtn = BaseButton(title: "生物辨識", titleColor: .white, font: .systemFont(ofSize: 14), backgroundColor: .black, action: #selector(tapTouchID), vc: self)
    lazy var normal_Btn = BaseButton(title: "常用選擇", titleColor: .white, font: .systemFont(ofSize: 14), backgroundColor: .black, action: #selector(normal_Selected), vc: self)
    lazy var startAnimated = BaseButton(title: "Start", titleColor: .white, font: .systemFont(ofSize: 14), backgroundColor: .black, action: #selector(startAnimation), vc: self)
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [textButton, noramlButton, memberButton, barCodeButton, normal_Btn])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    lazy var _stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [searchButton, barButton, noBingingBarButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    lazy var _stackView1: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [editCreditCardButton, searchService, gasStation])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    lazy var _stackView2: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [gasInfomation, parkingPay, cctv])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    lazy var _stackView3: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [oldCarBtn, searchParkingBtn, touchIDBtn])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    lazy var _stackView4: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [startAnimated])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubViews(stackView, _stackView, _stackView1, _stackView2, _stackView3, _stackView4)
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(150)
            $0.height.equalTo(40)
            $0.left.right.equalToSuperview()
        }
        
        _stackView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(20)
            $0.height.equalTo(40)
            $0.left.right.equalToSuperview()
        }
        
        _stackView1.snp.makeConstraints {
            $0.top.equalTo(_stackView.snp.bottom).offset(20)
            $0.height.equalTo(40)
            $0.left.right.equalToSuperview()
        }
        
        _stackView2.snp.makeConstraints {
            $0.top.equalTo(_stackView1.snp.bottom).offset(20)
            $0.height.equalTo(40)
            $0.left.right.equalToSuperview()
        }
        
        _stackView3.snp.makeConstraints {
            $0.top.equalTo(_stackView2.snp.bottom).offset(20)
            $0.height.equalTo(40)
            $0.left.right.equalToSuperview()
        }
        _stackView4.snp.makeConstraints {
            $0.top.equalTo(_stackView3.snp.bottom).offset(20)
            $0.height.equalTo(40)
            $0.left.right.equalToSuperview()
        }
        
    }
    
    @objc func didTapOnlyText() {
        let content = NSMutableAttributedString(string: DialogContent.update.content)
        let alertView = DialogViewController(type: .short, content: content)
        self.present(alertView, animated: true, completion: nil)
    }
    @objc func didTapNoraml() {
        let alertView = DialogViewController(type: .normal, title: "定期保養日期提醒", content:  strToAttributed(string: "您的愛車須於 2021/9/1 前回廠，方可享有準保送延保的權利。", location: 7, length: 8), isCenter: .left, showCancel: true, showConfirm: true, confirmTitle: "立即預約", cancelTitle: "之後再預約")
        self.present(alertView, animated: true, completion: nil)
    }
    @objc func didTapMember() {
        let alertView = DialogViewController(type: .terms, title: "會員條款", termsText: DialogContent.MembershipTerms.content)
        self.present(alertView, animated: true, completion: nil)
    }
    @objc func didTapPersonalCode() {
        self.presentToDialog(type: .personalCode, title: "個人條碼")
    }
    @objc func didTapSearch() {
        let alertView = DialogViewController(type: .search, title: "搜尋", showCancel: true, showConfirm: true, confirmTitle: "搜尋")
        self.present(alertView, animated: true, completion: nil)
    }
    @objc func didTapBarCode() {
        self.presentToDialog(type: .barcode, title: "雲端發票載具")
        
    }
    @objc func didTapNobinding() {
        self.presentToDialog(type: .noBingingBarCode, title: "雲端發票載具")
    }
    @objc func didTapEditing() {
        let alertView = DialogViewController(type: .editCreditCard, title: "編輯信用卡", bank: "中國信託", cardNumber: "**** **** **** 0987")
        self.present(alertView, animated: true, completion: nil)
    }
    @objc func tapService() {
        self.presentToDialog(type: .searchService, title: "搜尋服務廠")
    }
    @objc func tapGasStation() {
        self.presentToDialog(type: .searchGasStation, title: "搜尋加油站")
    }
    @objc func tapGasInfo() {
        self.presentToDialog(type: .gasInfomation, title: "油價資訊")
    }
    @objc func tapParkingPay() {
        self.presentToDialog(type: .parkingPay, title: "即時路況")
    }
    @objc func tapCCTV() {
        self.presentToDialog(type: .cctv, title: "即時路況")
    }
    @objc func tapOldCar() {
        self.presentToDialog(type: .oldCar, title: "認證中古車")
    }
    @objc func tapParking() {
        self.presentToDialog(type: .searchParking, title: "搜尋停車場")
    }
    @objc func tapTouchID() {
        self.presentToDialog(type: .biometrics(0), title: "生物辨識", showConfirm: true, confirmTitle: "取消")
    }
    @objc func normal_Selected() {
        let alertView = DialogViewController(type: .short, title: "刪除信用卡", content: strToAttributed(string: "已成功移轉 500 點", location: 7, length: 3), isCenter: .center, showCancel: true, showConfirm: true, confirmTitle: "完成", cancelTitle: "通知受贈者")
        self.present(alertView, animated: true, completion: nil)
    }
    
    @objc func startAnimation() {
        let logoView = LogoAnimatedViewController()
        self.present(logoView, animated: true, completion: nil)
    }
    
    
}


extension ViewController {
    func strToAttributed(string: String, location: Int, length: Int, textColor: UIColor =  UIColor(hexFromString: "CC0015")) -> NSAttributedString {
        let attribute = string.attributedString(font: .systemFont(ofSize: 15, weight: .black), textColor: .black, lineSpaceing: 3, wordSpaceing: 0)
        let finalStr = NSMutableAttributedString(attributedString: attribute)
        let range = NSRange(location: location, length:length)
        let anotherAttribute = [ NSAttributedString.Key.foregroundColor: textColor]
        finalStr.addAttributes(anotherAttribute, range: range)
        finalStr.addAttribute(NSAttributedString.Key.kern, value: 1, range: range)
        return finalStr
    }
    
    func presentToDialog(type: DialogType,
                         title: String,
                         showConfirm: Bool = false,
                         confirmTitle: String = "")
    {
        let alertView = DialogViewController(type: type, title: title, showConfirm: showConfirm, confirmTitle: confirmTitle)
        self.present(alertView, animated: true, completion: nil)
    }
}


