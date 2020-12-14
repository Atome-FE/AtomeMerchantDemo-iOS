//
//  CustumActionButton.swift
//  AtomeMerchantDemo
//
//  Created by boye on 2020/9/15.
//  Copyright © 2020 boye. All rights reserved.
//

import UIKit


class CustumActionButton: UIButton {
    static let size = CGSize(width: 270, height: 48)
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        
        setTitleColor(UIColor.darkBlack, for: .normal)
        backgroundColor = UIColor.canary
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
