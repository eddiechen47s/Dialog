//
//  PersonalCodeView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/16.
//

import UIKit

class PersonalCodeView: UIView {
    
    private let containerView = BaseView(color: #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 1), cornerRadius: 6)
    private let memberButton = BaseButton(title: "和泰集團會員", titleColor: .black, font: .systemFont(ofSize: 15, weight: .regular), backgroundColor: .white, action: #selector(tapMember), cornerRadius: 5)
    private let carrierButton = BaseButton(title: "雲端發票載具", titleColor: #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), font: .systemFont(ofSize: 15, weight: .regular), backgroundColor: .clear, action: #selector(tapCarrier), cornerRadius: 5)
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [memberButton, carrierButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.isScrollEnabled = false
        cv.register(MemberQRcodeView.self, forCellWithReuseIdentifier: MemberQRcodeView.identifity)
        cv.register(BarCodeViewCell.self, forCellWithReuseIdentifier: BarCodeViewCell.identifity)
        cv.register(CloudInvoiceViewCell.self, forCellWithReuseIdentifier: CloudInvoiceViewCell.identifity)
        return cv
    }()
    
    //是否本地綁定過載具
    var isBindCarries: Bool = true //到時候抓 userdefault 的值
    
    init() {
        super.init(frame: .zero)
        setpuUI()
    }
    
    private func setpuUI() {
        self.addSubViews(containerView, collectionView)
        containerView.addSubViews(stackView)
        containerView.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(40)
        }
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(4)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(5)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(snp.bottom)
        }
    }
    
    func selectedIndex(index: Int) {
        switch index {
        case 0:
            carrierButton.backgroundColor = .clear
            carrierButton.setTitleColor(#colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), for: .normal)
            memberButton.backgroundColor = .white
            memberButton.setTitleColor(.black, for: .normal)
            collectionView.selectItem(at: IndexPath(item: index, section: 0), animated: false, scrollPosition: .bottom)
        default:
            carrierButton.backgroundColor = .white
            carrierButton.setTitleColor(.black, for: .normal)
            memberButton.backgroundColor = .clear
            memberButton.setTitleColor(#colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), for: .normal)
            collectionView.selectItem(at: IndexPath(item: index, section: 0), animated: false, scrollPosition: .bottom)
        }
    }
    
    // MARK: - Selector
    @objc func tapMember() {
        self.selectedIndex(index: 0)
    }
    @objc func tapCarrier() {
        self.selectedIndex(index: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PersonalCodeView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberQRcodeView.identifity, for: indexPath) as? MemberQRcodeView else {
                fatalError("not found cell")
            }
            cell.config(with: "https://finance.ettoday.net/news/2056882")
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CloudInvoiceViewCell.identifity, for: indexPath) as? CloudInvoiceViewCell else {
                fatalError("not found cell")
            }
            cell.setupUI(with: self.isBindCarries)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    
    
}
