//
//  HomeContentArchView.swift
//  AtomeMerchantDemo
//
//  Created by boye on 2021/11/9.
//  Copyright © 2021 boye. All rights reserved.
//

import UIKit

class HomeContentArchView: UIView {
    static let contentHeight: CGFloat = 600
    
    private let archCoverView = UIImageView()
    private let centerView = UIView()
    private let centerViewHeight: CGFloat = 180
    private let centerViewWidth: CGFloat = UIScreen.main.bounds.width - 30

    override init(frame: CGRect) {
        super.init(frame: frame)

        archCoverView.backgroundColor = UIColor.white
        archCoverView.layer.cornerRadius = 5
        addSubview(archCoverView)
        archCoverView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(73)
            make.height.equalTo(HomeContentArchView.contentHeight)
        }

        addSubview(centerView)
        centerView.layer.cornerRadius = 10
        centerView.backgroundColor = UIColor.white

        let path = UIBezierPath()
        let shadowGap: CGFloat = 10
        path.move(to: CGPoint(x: -3, y: 0))
        path.addLine(to: CGPoint(x: -3, y: centerViewHeight - shadowGap))
        path.addLine(to: CGPoint(x: 0, y: centerViewHeight - shadowGap))
        path.addLine(to: CGPoint(x: -3, y: 0))
        path.move(to: CGPoint(x: centerViewWidth, y: 0))
        path.addLine(to: CGPoint(x: centerViewWidth, y: centerViewHeight - shadowGap))
        path.addLine(to: CGPoint(x: centerViewWidth + 3, y: centerViewHeight - shadowGap))
        path.addLine(to: CGPoint(x: centerViewWidth + 3, y: 0))
        path.close()
        centerView.layer.shadowPath = path.cgPath
        centerView.layer.shadowColor = UIColor(red: 9.0 / 255.0, green: 152.0 / 255.0, blue: 255.0 / 255.0, alpha: 0.8).cgColor
        centerView.layer.shadowOpacity = 0.8
        centerView.layer.shadowRadius = 10
        centerView.layer.shadowOffset = CGSize(width: 3, height: 0)

        centerView.snp.makeConstraints { (make) in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalToSuperview()
            make.height.equalTo(centerViewHeight)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews(_ contentView: UIView) {
        // just layout
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(centerView)
            make.top.equalTo(centerView)
            make.bottom.equalTo(archCoverView)
        }
    }
}
