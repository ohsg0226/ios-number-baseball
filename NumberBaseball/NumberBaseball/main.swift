//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func start() {
    print("게임을 실행합니다.")
    inputUserMenu()
}

func inputUserMenu() {
    var isRun: Bool = true
    
    while isRun {
        print("1. 게임시작 \n2. 게임종료")
        print("원하는 기능을 선택해주세요 :", terminator: " ")
        
        guard let userMenu = readLine() else { return }
        
        switch Int(userMenu) {
        case 1:
            playBaseballGame()
        case 2:
            print("게임종료")
            isRun = false
        default:
            print("입력이 잘못되었습니다")
        }
    }
}

func playBaseballGame() {
    let computerRandomNumbers: [Int] = drawRandomNumbers()
    var remainCount: Int = 9
    
    while remainCount > 0 {
        let userRandomNumbers = inputUserGuessingNumbers()
        let matchCount = checkMatchingCount(with: computerRandomNumbers, userRandomNumbers)
        let strikeCount = checkStrikeCount(with: computerRandomNumbers, userRandomNumbers)
        let ballCount = checkBallCount(matching: matchCount, strike: strikeCount)
        remainCount -= 1
        
        guard printMessages(with: userRandomNumbers, strikeCount, ballCount, remainCount) else { return }
    }
}

func drawRandomNumbers() -> [Int] {
    var uniqueRandomNumbers: Set<Int> = []
    var randomNumbers: [Int] = []
    var randomNumber: Int = 0
    
    while randomNumbers.count < 3 {
        randomNumber = Int.random(in: 1...9)
        
        if uniqueRandomNumbers.insert(randomNumber).inserted {
            randomNumbers.append(randomNumber)
        }
    }
    
    return randomNumbers
}

func inputUserGuessingNumbers() -> [Int] {
    let isAndrew: Bool = true
    
    while isAndrew {
        print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """, terminator: " ")
       
        
        guard let userGuessingNumbers = readLine() else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        let validUserGuessingNumbers = verifyUserGuessingNumbers(with: userGuessingNumbers)
        
        guard validUserGuessingNumbers.count == 3 else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        return validUserGuessingNumbers
    }
}

func verifyUserGuessingNumbers(with userGuessingNumbers: String) -> [Int] {
    let components = userGuessingNumbers.split(separator: " ")
    var validUserGuessingNumbers: [Int] = []
    
    guard components.count == 3 else { return [] }
    
    for component in components {
        guard let guessingNumber = Int(component),
              0 < guessingNumber,
              guessingNumber < 10,
              !validUserGuessingNumbers.contains(guessingNumber)
        else { return [] }
        
        validUserGuessingNumbers.append(guessingNumber)
    }
    
    return validUserGuessingNumbers
}

func checkMatchingCount(with computerRandomNumbers: [Int], _ userRandomNumbers: [Int]) -> Int {
    return Set(computerRandomNumbers).intersection(userRandomNumbers).count
}

func checkStrikeCount(with computerRandomNumbers: [Int], _ userRandomNumbers: [Int]) -> Int {
    return (0..<computerRandomNumbers.count).filter { computerRandomNumbers[$0] == userRandomNumbers[$0] }.count
}

func checkBallCount(matching matchCount: Int, strike strikeCount: Int) -> Int {
    return matchCount - strikeCount
}

func printMessages(with userRandomNumbers: [Int], _ strikeCount: Int, _ ballCount: Int, _ remainCount: Int) -> Bool {
    print("\n============================")
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    for _ in 0..<strikeCount {
        print("💛 ", terminator: "")
    }
    for _ in 0..<3 - strikeCount {
        print("🤍 ", terminator: "")
    }
    print("")
    for _ in 0..<ballCount {
        print("💚 ", terminator: "")
    }
    for _ in 0..<3 - ballCount {
        print("🤍 ", terminator: "")
    }
    print("\n============================\n")
    
    if strikeCount != 3 && remainCount == 0 {
        print("컴퓨터 승리...!")
        return false
    } else if strikeCount == 3 {
        print("사용자 승리!!!!")
        return false
    } else {
        print("남은 기회 : \(remainCount)")
    }
    
    return true
}

//MARK: 실행
start()
