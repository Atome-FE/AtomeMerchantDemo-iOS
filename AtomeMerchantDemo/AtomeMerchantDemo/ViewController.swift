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

let demoAmount: Int = 1234
let demoCurrency: String = "SGD"

class ViewController: UIViewController {
    
    private let textField = UITextField()
    private let confirmOrderButton = CustumActionButton(title: "Confirm Order")
    private let openAppButton = CustumActionButton(title: "Open Atome")
    private let responseLabel = UITextView()
    private let request = ConfirmOrderRequest()
    private var appPaymentUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(textField)
        textField.placeholder = "Please input your custum URL"
//        textField.text = "https://appdemo.apaylater.net/"
        textField.text = "atomedemo://appdemo.apaylater.net/"
        textField.borderStyle = .roundedRect
        textField.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(45)
        }
        
        view.addSubview(confirmOrderButton)
        confirmOrderButton.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.size.equalTo(CustumActionButton.size)
        }
        
        view.addSubview(openAppButton)
        openAppButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(confirmOrderButton.snp.bottom).offset(40)
            make.size.equalTo(CustumActionButton.size)
        }
        
        view.addSubview(responseLabel)
        responseLabel.isEditable = false
        responseLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(openAppButton.snp.bottom).offset(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
        }
        
        confirmOrderButton.addTarget(self, action: #selector(confirmOrder), for: .touchUpInside)
        openAppButton.addTarget(self, action: #selector(openAtome), for: .touchUpInside)
    }
    
    @objc func confirmOrder() {
        guard let url = textField.text else {
            debugPrint("url cant be nil")
            return
        }
        
        request.paymentResultUrl = url
        request.setCompletionBlock(success: { [weak self] (request) in
            guard let self = self else { return }
            self.openAppButton.isHidden = false
            self.responseLabel.text = request.responseString
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

