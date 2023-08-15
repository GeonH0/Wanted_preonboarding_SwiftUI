//
//  UIKitMVP - Presenter.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class Presenter {
    private let model: Calculator = Calculator()
    private weak var view: ViewController?
    
    init(view: ViewController?) {
        self.view = view
        
        let center = NotificationCenter.default
        center.addObserver(forName: Calculator.didChangeResultNotification,
                           object: nil,
                           queue: .main) { [weak self] (noti) in
            guard let result: Int = noti.userInfo?["result"] as? Int else {
                return
            }
            
            self?.view?.calculatorView.setResultText(String(describing: result))
        }
    }
}

extension Presenter: CalculatorViewDelegate {
    func didChangeTokenText(_ calculatorView: CalculatorView, token: String) {
        model.token = token
    }
    
    func didChangeInputText(_ calculatorView: CalculatorView, input: String) {
        model.input = input
    }
}
