//
//  CustumActionButton.swift
//  AtomeMerchantDemo
//
//  Created by boye on 2020/9/15.
//  Copyright © 2020 boye. All rights reserved.
//

import UIKit

class CustumActionButton: UIButton {
    static let size = CGSize(width: 150, height: 60)
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = UIColor(hex: 0x0998ff)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension UIColor {
    // hexColor
    convenience init(hex: UInt32, alpha: CGFloat = 1) {
        let r: CGFloat = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g: CGFloat = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b: CGFloat = CGFloat((hex & 0x0000FF)) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
