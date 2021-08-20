//
//  MemberTermsView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/16.
//

import UIKit
import SnapKit

class MemberTermsView: UIView {
    
    let termsLabel: UILabel = {
        let textView = UILabel()
        textView.numberOfLines = 0
        textView.font = .systemFont(ofSize: 15, weight: .regular)
        return textView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .white
        scrollview.showsVerticalScrollIndicator = false
        scrollview.delegate = self
        return scrollview
    }()
    private let contentView = UIView()
    private var widthConstraint: Constraint?

    private lazy var gradientView = UIView()

    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = GradientDirection.topToBottom.startPoint
        layer.endPoint = GradientDirection.topToBottom.endPoint
        layer.colors = [UIColor.white.withAlphaComponent(0.0).cgColor,
                        UIColor.white.withAlphaComponent(0.8).cgColor]
        layer.locations = [0, 1]
        return layer
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupGradientLayer(containerHeight: 50)
    }
    
    private func setupUI() {
        self.addSubViews(scrollView)
        scrollView.addSubViews(contentView)
        contentView.addSubViews(termsLabel)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.scrollView)
            make.width.equalTo(snp.width)
            make.height.equalTo(5000)
        }
        termsLabel.snp.makeConstraints {
            $0.top.left.right.equalTo(contentView)
            $0.height.equalTo(contentView.snp.height)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MemberTermsView: UIScrollViewDelegate {
    
    private func setupGradientLayer(containerHeight: CGFloat) {
        scrollView.delegate = self
        addSubview(gradientView)
        gradientView.snp.makeConstraints {
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.left.right.equalToSuperview()
            self.widthConstraint = $0.width.equalTo(contentView.snp.width).constraint
            $0.height.equalTo(containerHeight)
        }
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:containerHeight)

        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.height // scrollView高
        let contentOffsetY = scrollView.contentOffset.y
        let scrollAbleValue = scrollView.contentSize.height - height
        let percentage = (contentOffsetY / scrollAbleValue)*100
        self.gradientView.alpha = percentage > 90 ? 0 : 1
    }
}
