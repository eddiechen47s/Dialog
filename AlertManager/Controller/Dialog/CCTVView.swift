//
//  CCTVView.swift
//  AlertManager
//
//  Created by Eddie on 2021/8/18.
//

import UIKit
import MJPEGStreamLib

class CCTVView: UIView {
    private let cctvImageView = UIImageView()
    private var loadingIndicator = UIActivityIndicatorView()
    private let arrow_LeftBtn = BaseImgButton(imgName: "cctvLeft", action: #selector(tapLeft))
    private let arrow_RightBtn = BaseImgButton(imgName: "cctvRight", action: #selector(tapRight))
    private let locationLabel = BaseLabel(textColor: UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1), textAlignment: .center, font: UIFont(name: "PingFangTC-Regular", size: 17)!, attributedText: "國一．北上．0.0k", lineSpaceing: 0, wordSpaceing: 1.01)
    var stream: MJPEGStreamLib!
    var url: URL?
    var cctvResult: [String] = ["http://61.60.90.18:5001/Live?channel=1201&mode=0"]
    init() {
        super.init(frame: .zero)
        setupUI()
        setupCCTV()
    }
    
    private func setupCCTV() {
        // ImageView to the stream object
        stream = MJPEGStreamLib(imageView: cctvImageView)
        // Start loading
        stream.didStartLoading = { [unowned self] in
            self.loadingIndicator.startAnimating()
        }
        // Stop loading
        stream.didFinishLoading = { [unowned self] in
            self.loadingIndicator.stopAnimating()
        }
        guard let url = URL(string: cctvResult.first!) else {
            return
        }
        stream.contentURL = url
        stream.play()
//        stream.stop()
    }
    
    private func setupUI() {
       addSubViews(cctvImageView, loadingIndicator, locationLabel, arrow_LeftBtn, arrow_RightBtn)

        cctvImageView.snp.makeConstraints {
            $0.top.equalTo(snp.top)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(snp.bottom).offset(-75)
        }
        loadingIndicator.snp.makeConstraints {
            $0.center.equalTo(cctvImageView.snp.center)
            $0.width.height.equalTo(20)
        }
        locationLabel.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.bottom.equalTo(snp.bottom).offset(-30)
            $0.top.equalTo(cctvImageView.snp.bottom).offset(25)
            $0.width.equalTo(snp.width).multipliedBy(0.7)
        }
        arrow_LeftBtn.snp.makeConstraints {
            $0.left.equalTo(snp.left).offset(32)
            $0.centerY.equalTo(locationLabel.snp.centerY)
            $0.width.height.equalTo(30)
        }
        arrow_RightBtn.snp.makeConstraints {
            $0.right.equalTo(snp.right).offset(-32)
            $0.centerY.equalTo(locationLabel.snp.centerY)
            $0.width.height.equalTo(30)
        }
    }
    
    // MARK: - Selector
    @objc func tapLeft() {
        // Action
    }
    
    @objc func tapRight() {
        // Action
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
