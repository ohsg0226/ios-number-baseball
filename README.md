# ⚾️ 숫자야구

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

</br>

## 🍀 소개
`Hemg`와 `hoon` 팀이 만든 3개의 숫자로 하는 숫자 야구 게임입니다. 컴퓨터와의 승부에서 승리해야 합니다.
* 주요 개념: `Collection Types`, `Optionals`, `Naming`

</br>

## 👨‍💻 팀원
| Hemg | hoon |
| :--------: | :--------: |
| <Img src = "https://user-images.githubusercontent.com/101572902/235090676-acefc28d-a358-486b-b9a6-f9c84c52ae9c.jpeg" width="200" /> |<Img src="https://i.imgur.com/zXoi5OC.jpg" width="200">
|[Github Profile](https://github.com/hemg2) |[Github Profile](https://github.com/Hoon94)

</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.04.24.| 순서도 고민|
|2023.04.25.| 랜덤한 정수를 생성하는 함수 및 숫자비교 함수 구현|
|2023.04.26.| PR에 대한 피드백 반영|
|2023.04.27.| 사용자에게 숫자 3개 입력받는 함수 및 메뉴 선택하는 함수 구현|
|2023.04.28.| 프로젝트 회고 및 README 작성|

</br>

## 👀 시각화된 프로젝트 구조
<center><img width="600" height="1600" src="https://i.imgur.com/ARX3ccH.png"></center>

</br>

## 💻 실행 화면 

| 사용자 승리 | 컴퓨터 승리 | 잘못된 입력 |
|:--:|:--:|:--:|
|<img src="https://i.imgur.com/UnHB0MB.gif" width="300">|<img src="https://i.imgur.com/2UBfLwN.gif" width="300">|<img src="https://i.imgur.com/Qm0VppF.gif" width="300">|

</br>

## 🛠️ 트러블 슈팅
- #### `Set`과 `Array` 타입 활용
    순서도에서 생성한 사용자 랜덤 번호와 컴퓨터 랜덤 번호를 비교하기 위해 어떠한 자료구조를 사용할지에 대해 고민하였습니다. 볼은 순서(위치)와 관계없이 서로 같은 숫자가 있는지를 확인함으로 `Set`을 사용하였고 스트라이크는 순서(위치)와 관련하여 같은 위치에 같은 값이 있는지를 판단하기 때문에 `Array`를 사용하였습니다.

- #### 함수의 재활용성
    사용자의 랜덤 숫자 생성과 컴퓨터의 랜덤 숫자 생성 기능을 처음에는 개별 함수로 선언하였습니다. 하지만 결괏값을 받는 변수 즉, 사용자인지 컴퓨터인지의 차이만 존재할 뿐 같은 기능을 수행하므로 하나의 함수로 변경하였습니다.

- `generateRandomNumber()`의 함수에서 랜덤 숫자을 만들고 `randomNumber` 에 할당을 진행했었습니다.

    ```swift
    func generateRandomNumber() -> Int {
        return Int.random(in: 1...9)
    }

    while randomNumbers.count < 3 {
        randomNumber = generateRandomNumber()
    ```

    `randomNumber`에서 `generateRandomNumber()` 함수를 호출하는 방식에서 `Int.random(in: 1...9)`로 랜덤 숫자를 가져오는 방식으로 변경하였습니다.

    ```swift    
    while randomNumbers.count < 3 {
        randomNumber = Int.random(in: 1...9)
    ```

- #### 중복 숫자 확인에 대한 활용
    랜덤 숫자를 포함시킬때 inserted의 대한 부분에 대해서 처음에는 `Set`을 사용하여 `insert`와 `contains`를해서 숫자를 포함시켰는데 `Array` 로 변경함에 있어서 중복된 숫자를 포함 시키지 않기 위해서 어떤 방법을 선택해야 할지 고민하다가 inserted을 사용하여 진행했습니다.

- #### `split` 함수
    `split`을 이용하여 `readLine` 사용시에 인덱스로 나눌 수 있다고 생각했습니다. `readLine`의 타입이 `String` 값이라 `if let` 바인딩을 하여 `Int` 값으로 변경하여 사용 하려고 했습니다. 처음 생각이 `["1, 2, 3"]` 이라고 생각되어 인트로 감싸서 `Int([1, 2, 3])` 해서 출력이 될꺼라고 생각했었는데 이점에서 잘못 알고 있어 배열 `Int`로 감쌀수없다는 것을 알게 되었고 그래서 `for`문을 통해 인덱스값 하나하나를 `Int`로 변경후 사용하게 되었습니다.

    ```swift
    let components = userGuessingNumbers.split(separator: " ")
    for component in components {
    guard let guessingNumber = Int(component),
                  0 < guessingNumber,
                  guessingNumber < 10
    ```

- #### 코드의 길이 

    ```swift
    guard printMessages(userRandomNumbers: userRandomNumbers, strikeCount: strikeCount, ballCount: ballCount, remainCount: remainCount) else { return }
    ```
    
    최대 길이 100자 제한을 지키기 위해 `printMessages` 함수에 전달인자 레이블로 wildcard 패턴을 사용하였습니다.
    ```swift
    guard printMessages(with: userRandomNumbers, strikeCount, ballCount, remainCount) else { return }
    ```

</br>

## 📚 참고 링크
[🍎Apple Docs: API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
[🍎Apple Docs: Optionals](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Optionals)
[🍎Apple Docs: nil](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#nil)
[🍎Apple Docs: Optional Binding](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Optional-Binding)
[🍎Apple Docs: Collection Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes/)

</br>

## 👥 팀 회고
- [팀 회고 링크](https://github.com/hemg2/ios-number-baseball/blob/main/%ED%8C%80%ED%9A%8C%EA%B3%A0.md)
