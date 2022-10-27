//
//  HomeContentView.swift
//  AtomeMerchantDemo
//
//  Created by boye on 2021/11/9.
//  Copyright © 2021 boye. All rights reserved.
//

import UIKit

class HomeContentView: UIView {
    var getStartCallback: (()->Void)?
    
    private let descLabel = UILabel()
    private let gettingStartButton = GradientButton(title: "Get start")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        descLabel.textAlignment = .center
        descLabel.font = UIFont.boldSystemFont(ofSize: 15)
        descLabel.textColor = UIColor.darkGray
        descLabel.text = "Click the button below to start"
        addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        addSubview(gettingStartButton)
        gettingStartButton.layer.cornerRadius = GradientButton.buttonSize.height / 2
        gettingStartButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descLabel.snp.bottom).offset(30)
            make.size.equalTo(GradientButton.buttonSize)
        }
        
        gettingStartButton.addTarget(self, action: #selector(getStartAction), for: .touchUpInside)
    }
    
    @objc private func getStartAction() {
        getStartCallback?()
    }
}
