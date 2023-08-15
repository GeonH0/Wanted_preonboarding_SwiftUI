//
//  UIKitMVVM - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import Combine

class ViewController: UIViewController {

    private let calculatorView: CalculatorView = CalculatorView(frame: .zero)
    private let viewModel: ViewModel = ViewModel()
//    private var observation: NSKeyValueObservation?
    private var cancellabe: AnyCancellable?
    
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
        
//        observation = viewModel.observe(\.result, options: [.new]) { viewModel, changes in
//            guard let newValue = changes.newValue else { return }
//            self.calculatorView.setResultText(String(describing: newValue))
//        }
        
        cancellabe = viewModel.$result.sink(receiveValue: { result in
            self.calculatorView.setResultText(String(describing: result))
        })
        
        calculatorView.delegate = viewModel
    }
}

