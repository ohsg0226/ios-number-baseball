//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerRandomNumbers: Set<Int> = []
var userRandomNumbers: Set<Int> = []
var remainCount: Int = 9
var ballCount: Int = 0

func generateRandomNumber() -> Int {
    return Int.random(in: 1...9)
}

func addNumbers() -> Set<Int> {
    var randomNumbers: Set<Int> = []
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(generateRandomNumber())
    }
    
    return randomNumbers
}

func checkMatchingCount() -> Int {
    return computerRandomNumbers.intersection(userRandomNumbers).count
}
