//
//  UIKitMVP - CalculatorView.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

@objc
protocol CalculatorViewDelegate: AnyObject {
    func didChangeTokenText(_ calculatorView: CalculatorView, token: String)
    func didChangeInputText(_ calculatorView: CalculatorView, input: String)
}

class CalculatorView: UIView {

    weak var delegate: CalculatorViewDelegate?
    
    private lazy var tokenTextField: UITextField = {
        let field: UITextField = UITextField()
        field.font = .preferredFont(forTextStyle: .body)
        field.borderStyle = .roundedRect
        field.backgroundColor = .secondarySystemBackground
        field.addTarget(self,
                        action: #selector(didChangeTokenText),
                        for: .editingChanged)
        field.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return field
    }()
    
    private lazy var inputTextField: UITextField = {
        let field: UITextField = UITextField()
        field.font = .preferredFont(forTextStyle: .headline)
        field.borderStyle = .roundedRect
        field.backgroundColor = .secondarySystemBackground
        field.addTarget(self,
                        action: #selector(didChangeInputText),
                        for: .editingChanged)
        field.setContentHuggingPriority(.required, for: .vertical)
        return field
    }()
    
    private lazy var resultLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let vStack: UIStackView = UIStackView(arrangedSubviews: [tokenTextField, inputTextField, resultLabel])
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = 16
        vStack.alignment = .fill
        vStack.distribution = .fill
        
        return vStack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension CalculatorView {
    
    @objc private func didChangeTokenText(_ field: UITextField) {
        delegate?.didChangeTokenText(self,
                                     token: field.text ?? " ")
    }
    
    @objc private func didChangeInputText(_ field: UITextField) {
        delegate?.didChangeInputText(self,
                                     input: field.text ?? "")
    }
    
    func setResultText(_ text: String) {
        resultLabel.text = text
    }
}
