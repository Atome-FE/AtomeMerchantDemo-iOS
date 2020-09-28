//
//  ConfirmOrderRequest.swift
//  AtomeMerchantDemo
//
//  Created by boye on 2020/9/16.
//  Copyright © 2020 boye. All rights reserved.
//

import UIKit
import NetworkRequester

class ConfirmOrderRequest: NetworkRequester {
    override func baseUrl() -> String {
        return "https://demo-app-test.apaylater.net"
    }
    
    override func requestMethod() -> RequestMethod {
        return .post
    }
    
    override func requestUrl() -> String {
        return "/api/orders"
    }
    
    override func requestArgument() -> Any? {
        return ["currency": "SGD", "amount": 1234, "paymentResultUrl": "https://appdemo.apaylater.net/"]
    }
    
    override func parameterEncoder() -> RequestParameterEncoder {
        return .jsonDefault
    }
}
