//
//  TableViewHeader.swift
//  AtomeMerchantDemo
//
//  Created by boye on 2020/12/14.
//  Copyright © 2020 boye. All rights reserved.
//

import UIKit

class ViewHeader: UIView {
    private let logoView = UIImageView(image: UIImage(named: "logoDark"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.canary
        addSubview(logoView)
        logoView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
