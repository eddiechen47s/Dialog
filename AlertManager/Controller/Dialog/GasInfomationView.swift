//
//  GasInfomationView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/6.
//

import UIKit

class GasInfomationView: UIView {
    
    private let containerView = BaseView(color: #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 1), cornerRadius: 6)
    private let nextWeekButton = BaseButton(title: "下週預測", titleColor: .black, font: .systemFont(ofSize: 15, weight: .medium), backgroundColor: .white, action: #selector(tapNextWeek), cornerRadius: 5)
    private let weeksButton = BaseButton(title: "本週預測", titleColor: #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), font: .systemFont(ofSize: 15, weight: .medium), backgroundColor: .clear, action: #selector(tapWeek), cornerRadius: 5)
    private let dateLabel = BaseLabel(text: "(2021/07/19~2021/07/25)", textColor: .black, textAlignment: .center, font: .systemFont(ofSize: 13))
    private let detailLabel = BaseLabel(text: "※ 實際油價依中油週日公布", textColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), textAlignment: .center, font: .systemFont(ofSize: 13, weight: .regular))
    private let gasPageDownImg = BaseImageView(imageName: "gasPageDown", backgroundColor: .clear)

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        //        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.isScrollEnabled = false
        cv.backgroundColor = .white
        cv.register(GasCompareViewCell.self, forCellWithReuseIdentifier: GasCompareViewCell.identifity)
        cv.register(GasCompareDetailViewCell.self, forCellWithReuseIdentifier: GasCompareDetailViewCell.identifity)
        return cv
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        detailLabel.backgroundColor = #colorLiteral(red: 0.9960784314, green: 1, blue: 1, alpha: 1)
    }
    
    // MARK: - Helpers
    private func setupUI() {
        addSubViews(containerView, dateLabel, collectionView, detailLabel, gasPageDownImg)
        containerView.addSubViews(nextWeekButton, weeksButton)
        containerView.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(40)
        }
        nextWeekButton.snp.makeConstraints {
            $0.centerY.equalTo(containerView.snp.centerY)
            $0.left.equalTo(containerView.snp.left).offset(4)
            $0.width.equalTo(containerView.snp.width).multipliedBy(0.48)
            $0.height.equalTo(containerView.snp.height).multipliedBy(0.8)
        }
        weeksButton.snp.makeConstraints {
            $0.centerY.equalTo(containerView.snp.centerY)
            $0.right.equalTo(containerView.snp.right).offset(-4)
            $0.width.equalTo(containerView.snp.width).multipliedBy(0.48)
            $0.height.equalTo(containerView.snp.height).multipliedBy(0.8)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom).offset(11)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(20)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(detailLabel.snp.top).offset(-10)
        }
        detailLabel.snp.makeConstraints {
            $0.bottom.equalTo(gasPageDownImg.snp.top).offset(-20)
            $0.centerX.equalTo(snp.centerX)
            $0.width.equalTo(snp.width)
            $0.height.equalTo(20)
        }
        gasPageDownImg.snp.makeConstraints {
            $0.bottom.equalTo(snp.bottom).offset(-18)
            $0.centerX.equalTo(snp.centerX)
            $0.width.equalTo(130)
            $0.height.equalTo(16)
        }
    }
    
    func selectedIndex(index: Int) {
        switch index {
        case 0:
            nextWeekButton.backgroundColor = .white
            nextWeekButton.setTitleColor(.black, for: .normal)
            weeksButton.backgroundColor = .clear
            weeksButton.setTitleColor(#colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), for: .normal)
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: false)
        case 1:
            nextWeekButton.backgroundColor = .clear
            nextWeekButton.setTitleColor(#colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1), for: .normal)
            weeksButton.backgroundColor = .white
            weeksButton.setTitleColor(.black, for: .normal)
            collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
        default:
            break
        }
        
    }
    
    // MARK: - Selector
    @objc func tapNextWeek() {
        self.selectedIndex(index: 0)
        self.detailLabel.text = "※ 實際油價依中油週日公布"
    }
    @objc func tapWeek() {
        self.selectedIndex(index: 1)
        self.detailLabel.text = "※ 此為中油公告油價"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GasInfomationView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GasCompareViewCell.identifity, for: indexPath) as? GasCompareViewCell else {
                fatalError("cell nil")
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GasCompareDetailViewCell.identifity, for: indexPath) as? GasCompareDetailViewCell else {
                fatalError("cell nil")
            }
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension GasInfomationView {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            if let row = collectionView.indexPath(for: cell)?.item {
                print(row)
            }
        }
    }
}
