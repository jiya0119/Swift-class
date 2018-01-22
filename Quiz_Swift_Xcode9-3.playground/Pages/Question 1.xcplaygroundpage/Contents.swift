//: [시험안내](@previous)

/*: 
# 1번 문제
## 최대값 구하기
#### 10점
아래 maxArray 함수를 정수의 배열을 받아서 가장 큰 수를 리턴하는 함수로 구현하라.
*/

import Foundation


func maxArray (numbers:[Int]) -> Int {
    return numbers.sorted(by:>).first!
}

let arrayToMax = [43, 56, 12, 23, 87, 27, 98]
let maxNum = maxArray(numbers: arrayToMax)

//: ### 정답 확인 영역
assert(maxNum == 98)

//: [2번 문제](@next)
