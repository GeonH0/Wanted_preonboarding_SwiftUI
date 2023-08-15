//
//  UIKitMVVM - ViewModel.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class ViewModel: NSObject {
    private let model: Calculator = Calculator()
    var inputText: String = "" {
        didSet {
            model.input = inputText
        }
    }
    var token: String = " " {
        didSet {
            model.token = token
        }
    }
//    @objc dynamic var result: Int = 0
    @Published var result: Int = 0
    
    override init() {
        super.init()
        
        let center = NotificationCenter.default
        center.addObserver(forName: Calculator.didChangeResultNotification, object: nil, queue: .main) { noti in
            guard let result: Int = noti.userInfo?["result"] as? Int else {
                return
            }
            
            self.result = result
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ViewModel: CalculatorViewDelegate {
    func didChangeTokenText(_ calculatorView: CalculatorView, token: String) {
        self.token = token
    }
    
    func didChangeInputText(_ calculatorView: CalculatorView, input: String) {
        self.inputText = input
    }
}
