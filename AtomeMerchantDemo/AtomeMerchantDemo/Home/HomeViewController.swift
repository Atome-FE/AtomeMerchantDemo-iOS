//
//  HomeViewController.swift
//  AtomeMerchantDemo
//
//  Created by boye on 2021/11/8.
//  Copyright © 2021 boye. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let backgroundImageView = UIImageView()
    private let bottomCoverView = UIView()
    private let logoImageView = UIImageView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let coverView = HomeContentArchView()
    private let homeContentView = HomeContentView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupAction()
    }
    
    private func setupUI() {
        backgroundImageView.backgroundColor = UIColor.canary
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        view.addSubview(bottomCoverView)
        bottomCoverView.backgroundColor = UIColor.white
        bottomCoverView.snp.makeConstraints { (make) in
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height / 2)
        }

        logoImageView.image = UIImage(named: "logoDark")
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(38)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(110)
            make.height.equalTo(21)
        }

        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        contentView.addSubview(coverView)
        coverView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(HomeContentArchView.contentHeight)
        }
        
        coverView.addViews(homeContentView)
    }
    
    private func setupAction() {
        homeContentView.getStartCallback = { [weak self] in
            guard let self = self else { return }
            let vc = ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
