//
//  ViewController.swift
//  AtomeMerchantDemo
//
//  Created by boye on 2020/9/15.
//  Copyright © 2020 boye. All rights reserved.
//

import UIKit
import SnapKit
import AtomeSDK

class ViewController: UIViewController {
    
    private let confirmOrderButton = CustumActionButton(title: "Confirm Order")
    private let openAppButton = CustumActionButton(title: "Open Atome")
    private let request = ConfirmOrderRequest()
    private var appPaymentUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(confirmOrderButton)
        confirmOrderButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.centerY).offset(-40)
            make.centerX.equalToSuperview()
            make.size.equalTo(CustumActionButton.size)
        }
        
        view.addSubview(openAppButton)
        openAppButton.isHidden = true
        openAppButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.centerY).offset(40)
            make.size.equalTo(CustumActionButton.size)
        }
        
        confirmOrderButton.addTarget(self, action: #selector(confirmOrder), for: .touchUpInside)
        openAppButton.addTarget(self, action: #selector(openAtome), for: .touchUpInside)
    }
    
    @objc func confirmOrder() {
        request.setCompletionBlock(success: { [weak self] (request) in
            guard let self = self else { return }
            self.openAppButton.isHidden = false
            guard let dict = request.responseObject as? [String: Any],
                let datas = dict["data"] as? [String: Any],
                let paymentURL = datas["appPaymentUrl"] as? String else {
                return
            }
            self.appPaymentUrl = paymentURL
            
        }) { (request) in
            print(request.error as Any)
        }
        request.start()
    }
    
    @objc func openAtome() {
        guard let urlString = appPaymentUrl,
            let url = URL(string: urlString) else {
            return
        }
        
        if AtomeManager.shared.canHandPaymentURL(url) {
            AtomeManager.shared.handPaymentURL(url)
        }
    }
}

