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
import RxSwift
import RxCocoa
import PKHUD

let demoAmount: Int = 1234
let demoCurrency: String = "SGD"

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let statusBarBackgroundView = UIView()
    private let topCoverView = ViewHeader()
    
    private let textField = UITextField()
    private let confirmOrderButton = GradientButton(title: "Confirm Order")
    private let openAppButton = GradientButton(title: "Open Atome")
    private let responseLabel = UITextView()
    private let request = ConfirmOrderRequest()
    private var appPaymentUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupAction()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.whiteTwo
        
        view.addSubview(statusBarBackgroundView)
        statusBarBackgroundView.backgroundColor = UIColor.canary
        statusBarBackgroundView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        view.addSubview(topCoverView)
        topCoverView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(120)
        }
        
        view.addSubview(textField)
        textField.placeholder = "Please input your custum URL"
//        textField.text = "https://appdemo.apaylater.net/"
        textField.text = "atomedemo://appdemo.apaylater.net/"
        textField.borderStyle = .roundedRect
        textField.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalTo(topCoverView.snp.bottom).offset(20)
            make.height.equalTo(45)
        }

        view.addSubview(confirmOrderButton)
        confirmOrderButton.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.size.equalTo(GradientButton.buttonSize)
        }

        view.addSubview(openAppButton)
        openAppButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(confirmOrderButton.snp.bottom).offset(40)
            make.size.equalTo(GradientButton.buttonSize)
        }

        view.addSubview(responseLabel)
        responseLabel.isEditable = false
        responseLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(openAppButton.snp.bottom).offset(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
        }
    }
    
    private func setupAction() {
        confirmOrderButton.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.confirmOrder()
        }).disposed(by: disposeBag)
        
        openAppButton.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.openAtome()
        }).disposed(by: disposeBag)
    }
    
    @objc func confirmOrder() {
        guard let url = textField.text else {
            HUD.flash(.label("Url cant be nil!"), delay: 1)
            return
        }
        HUD.show(.progress)
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
            HUD.hide(nil)
        }) { (request) in
            print(request.error as Any)
            HUD.hide(nil)
        }
        request.start()
    }
    
    @objc func openAtome() {
        guard let urlString = appPaymentUrl,
            let url = URL(string: urlString) else {
            HUD.flash(.label("Cant open Atome app, Pls confirm order first!"), delay: 1)
            return
        }
        
        if AtomeManager.shared().isAtomeInstalled() {
            debugPrint("Atome already installed")
        } else {
            debugPrint("Atome not installed, please go to download")
        }
        
        AtomeManager.shared().handPaymentURL(url)
    }
}

