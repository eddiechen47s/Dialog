//
//  MaintainDay.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/23.
//

import UIKit
import DropDown

class DialogViewController: BaseDialogViewController {
    
    let type: DialogType
    private lazy var dialogView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    private var contentLabel = CustomLabel()
    private lazy var closcButton = BaseImgButton(imgName: "Union", action: #selector(didTappedClose), vc: self)
    lazy var cancelButton = BaseButton(title: "", titleColor: UIColor(hexFromString: "CC0015"), font: .systemFont(ofSize: 15, weight: .regular), backgroundColor: .clear, action: #selector(didTappedClose), vc: self, cornerRadius: 10)
    lazy var confirmButton = BaseButton(title: "確認", titleColor: .white, font: .systemFont(ofSize: 15, weight: .regular), backgroundColor: UIColor(hexFromString: "CC0015"), action: #selector(didTappedClose), vc: self, cornerRadius: 10)

    var isShowCancelButton: Bool = false
    var isShowConfiremButton: Bool = false
    private let titleLabel = BaseLabel(textColor: .black, textAlignment: .center, font: .systemFont(ofSize: 17, weight: .regular))

    private let checkBoxImg = BaseImageView(imageName: "unCheckBox")
    
    private let containerView = UIView()
    
    var terms: String?
    var bank: String = ""
    var cardNumber: String = ""
    
    init(type: DialogType, title: String = "",content: NSAttributedString = NSAttributedString(string: ""), isCenter: NSTextAlignment = .left, showCancel: Bool = false, showConfirm: Bool = false, termsText: String = "", bank: String = "", cardNumber: String = "", confirmTitle: String = "確認", cancelTitle: String = "關閉") {
        self.type = type
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
        self.titleLabel.text = title
        
        self.contentLabel.attributedText = content
        contentLabel.numberOfLines = 0
        contentLabel.font = type.isTextCenter ? .systemFont(ofSize: 20) : .systemFont(ofSize: 14)
        contentLabel.verticalAlignment = .Middle
        contentLabel.textAlignment = isCenter
        
        self.terms = termsText
        
        self.isShowCancelButton = showCancel
        self.isShowConfiremButton = showConfirm
        
        self.cancelButton.isHidden = !self.isShowCancelButton
        self.confirmButton.isHidden = !self.isShowConfiremButton
        
        self.confirmButton.setTitle(confirmTitle, for: .normal)
        self.cancelButton.setTitle(cancelTitle, for: .normal)
        
        self.bank = bank
        self.cardNumber = cardNumber
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setupDiglog()
        dismissToFornt()
    }
    
    // MARK: Helper
    func dismissToFornt() {
        let gestureBackground = UITapGestureRecognizer(target: self, action: #selector(didTappedClose))
        gestureBackground.numberOfTapsRequired = 1
        gestureBackground.numberOfTouchesRequired = 1
        backgroundView.addGestureRecognizer(gestureBackground)
        backgroundView.isUserInteractionEnabled = true
    }
    
    func scaleScreenHeight(_ value: CGFloat, baseScreenHeight: CGFloat = 604) -> CGFloat {
        return value * (type.dialogHeight*self.view.frame.height) / baseScreenHeight
    }
    
    override func setupDiglog() {
        self.backgroundView.addSubview(self.dialogView)
        
        view.addSubViews(dialogView, titleLabel, closcButton, contentLabel)
        dialogView.snp.makeConstraints {
            $0.center.equalTo(backgroundView.snp.center)
            $0.width.equalToSuperview().inset(18)
            $0.height.equalTo(type.dialogHeight)
        }
        
        closcButton.snp.makeConstraints {
            $0.top.equalTo(dialogView.snp.top).offset(29.3)
            $0.left.equalTo(dialogView).inset(24.3)
            $0.width.height.equalTo(14.4)
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(closcButton.snp.centerY).offset(-1)
            $0.centerX.equalTo(dialogView.snp.centerX)
            $0.width.equalTo(dialogView.snp.width).multipliedBy(0.8)
            $0.height.equalTo(20)
        }
        if type.isShowContent {
            contentLabel.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(0)
                $0.left.right.equalTo(dialogView).inset(20)
                $0.height.equalTo(dialogView.snp.height).multipliedBy(0.5)
            }
        }
        if self.isShowCancelButton || self.isShowConfiremButton {
            let stackView = UIStackView(arrangedSubviews: [cancelButton, confirmButton])
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 8
            dialogView.addSubview(stackView)
            stackView.snp.makeConstraints {
                $0.bottom.equalTo(dialogView.snp.bottom).offset(-20)
                $0.centerX.equalTo(dialogView.snp.centerX)
                $0.left.right.equalTo(dialogView).inset(23)
            }
            if self.isShowCancelButton {
                stackView.snp.makeConstraints {
                    $0.height.equalTo(35)
                }
            }
            if self.isShowConfiremButton {
                stackView.snp.makeConstraints {
                    $0.height.equalTo(35)
                }
            }
        }
        
        switch self.type {
        case .normal:
            break
        case .personalCode: //個人條碼
            let codeView = PersonalCodeView()
            dialogView.addSubview(codeView)
            codeView.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom)
                $0.left.right.equalTo(dialogView).inset(20)
                $0.bottom.equalTo(dialogView.snp.bottom)
            }
        case .terms: //會員條款
            let memberTermsView = MemberTermsView()
            dialogView.addSubview(memberTermsView)
            memberTermsView.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(17)
                $0.left.right.equalToSuperview().inset(20)
                $0.bottom.equalTo(dialogView.snp.bottom).offset(-25)
            }
            memberTermsView.termsLabel.text = terms
        case .short:
            break
        case .search:
            let view = SearchServiceView()
            dialogView.addSubview(view)
            view.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(24.8)
                $0.left.right.equalToSuperview().inset(20)
                $0.bottom.equalTo(dialogView.snp.bottom).offset(-25)
            }
        case .barcode:
            let view = BarCodeView()
            dialogView.addSubview(view)
            view.snp.makeConstraints {
                $0.left.right.bottom.equalToSuperview()
                $0.top.equalTo(closcButton.snp.bottom)
            }
        case .noBingingBarCode:
            let view = NoBindCarrierView()
            dialogView.addSubview(view)
            view.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(24.8)
                $0.left.right.equalToSuperview().inset(20)
                $0.bottom.equalTo(dialogView.snp.bottom).offset(-25)
            }
        case .editCreditCard:
            let view = EditCreditCardView()
            view.config(bank: self.bank, CarNum: self.cardNumber)
            dialogView.addSubview(view)
            view.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(24.8)
                $0.left.right.equalToSuperview().inset(25)
                $0.bottom.equalTo(dialogView.snp.bottom)
            }
        case .searchService:
            let serviceView = SearchServiceDetailView()
            //展示場
            //            let serviceView = SearchServiceDetailView(isShowAll: false)
            dialogView.addSubview(serviceView)
            serviceView.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(24.8)
                $0.left.right.equalTo(dialogView).inset(27)
                $0.bottom.equalTo(dialogView.snp.bottom)
            }
        case .searchGasStation: //搜尋加油站
            let gasView = SearchGasStationView()
            dialogView.addSubview(gasView)
            gasView.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(10)
                $0.left.right.equalTo(dialogView).inset(27)
                $0.bottom.equalTo(dialogView.snp.bottom)
            }
        case .gasInfomation: //油價資訊
            let gasInfo = GasInfomationView()
            dialogView.addSubview(gasInfo)
            gasInfo.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(10)
                $0.left.right.equalTo(dialogView).inset(20)
                $0.bottom.equalTo(dialogView.snp.bottom)
            }
        case .parkingPay: //停車場資訊
            let parkingView = ParkingPayView()
            dialogView.addSubview(parkingView)
            parkingView.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(13.8)
                $0.left.right.equalTo(dialogView).inset(16)
                $0.bottom.equalTo(dialogView.snp.bottom)
            }
            parkingView.close = {
                self.dismiss(animated: true, completion: nil)
            }
        case .cctv: //即時路況
            let cctv = CCTVView()
            dialogView.addSubViews(cctv)
            cctv.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(24.8)
                $0.left.right.equalTo(dialogView)
                $0.bottom.equalTo(dialogView.snp.bottom)
            }
        case .oldCar: //認證中古車
            let view = OldCarView()
            dialogView.addSubview(view)
            view.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(24.8)
                $0.left.right.equalToSuperview().inset(20)
                $0.bottom.equalTo(dialogView.snp.bottom)
            }
        case .searchParking: //搜尋停車場
            let parkingView = SearchParkingView()
            dialogView.addSubview(parkingView)
            parkingView.snp.makeConstraints {
                $0.top.equalTo(closcButton.snp.bottom).offset(24.8)
                $0.left.right.equalToSuperview().inset(20)
                $0.bottom.equalTo(dialogView.snp.bottom)
            }
        case .biometrics(let type):
            print(type)
            let view = BiometricsView(type: type)
            dialogView.addSubview(view)
            view.snp.makeConstraints {
                $0.top.left.right.equalToSuperview()
                $0.bottom.equalToSuperview().offset(-60)
            }
            closcButton.isHidden = true
            titleLabel.isHidden = true
        }
    }

    // MARK: Selector
    @objc func didTappedClose(){
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension DialogViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberQRcodeView.identifity, for: indexPath) as? MemberQRcodeView else {
                fatalError("not found cell")
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CloudInvoiceViewCell.identifity, for: indexPath) as? CloudInvoiceViewCell else {
                fatalError("not found cell")
            }
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: dialogView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    
}

extension DialogViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        self.animationView.snp.remakeConstraints {
        //            $0.left.equalTo(scrollView.contentOffset.x/2)
        //            $0.bottom.equalTo(animationTitleView.snp.bottom)
        //            $0.width.equalTo(dialogView.snp.width).multipliedBy(0.5)
        //            $0.height.equalTo(3)
        //        }
        
        //        if scrollView.contentOffset.x > dialogView.frame.width / 2 {
        //            self.memberButton.setTitleColor(.black, for: .normal)
        //            self.billButton.setTitleColor(.systemRed, for: .normal)
        //        } else {
        //            self.memberButton.setTitleColor(.systemRed, for: .normal)
        //            self.billButton.setTitleColor(.black, for: .normal)
        //        }
    }
}

extension DialogViewController {
    
    func scrollToItem(index: Int) {
        let index = IndexPath(item: index, section: 0)
        //        collectionView.scrollToItem(at: index, at: .bottom, animated: true)
    }
}



extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

enum DialogSearchCity: String, CaseIterable {
    case city
    
    var value: [String] {
        switch self {
        case .city:
            return ["臺北市",
                    "新北市",
                    "基隆市",
                    "桃園市",
                    "新竹縣"
            ]
        }
    }
}
