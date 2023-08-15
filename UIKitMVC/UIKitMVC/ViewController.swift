//
//  UIKitMVC - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    private let calculatorView: CalculatorView = CalculatorView(frame: .zero)
    private let model: Calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(calculatorView)
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calculatorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            calculatorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
        calculatorView.delegate = self
        
        let center = NotificationCenter.default
        center.addObserver(forName: Calculator.didChangeResultNotification,
                           object: nil,
                           queue: .main) { [weak self] (noti) in
            guard let result: Int = noti.userInfo?["result"] as? Int else {
                return
            }
            
            self?.calculatorView.setResultText(String(describing: result))
        }
    }
}

extension ViewController: CalculatorViewDelegate {
    func didChangeTokenText(_ calculatorView: CalculatorView, token: String) {
        model.token = token
    }
    
    func didChangeInputText(_ calculatorView: CalculatorView, input: String) {
        model.input = input
    }
}
