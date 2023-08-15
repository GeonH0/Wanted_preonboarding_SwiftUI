//
//  UIKitMVC - Model.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class Calculator {
    static let didChangeResultNotification = Notification.Name("did result changed")
    
    var token: String = " "
    var input: String = "" {
        didSet {
            result = calculate(with: input)
        }
    }
    var result: Int = 0 {
        didSet {
            NotificationCenter.default.post(name: Self.didChangeResultNotification,
                                            object: nil,
                                            userInfo: ["result":result])
        }
    }
    
    func calculate(with input: String) -> Int {
        input.components(separatedBy: CharacterSet(charactersIn: token))
            .compactMap { Int($0) }
            .reduce(0, +)
    }
}
