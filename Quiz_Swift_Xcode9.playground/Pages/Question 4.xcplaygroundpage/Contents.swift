//: [3번 문제](@previous)

/*:
 # 4번 문제
 ## 구조체와 클래스
 #### 20점
 
 아래 정답 확인 영역에서 에러가 없도록 하라
 */


import Foundation

struct Engine { //구조체
    let fuel:String
    var valve:Int
}
struct Vehicle { //구조체
    let engine:Engine
    var capacity = 0
    init(engine:Engine){
        self.engine = engine
    }
}

let v8 = Engine(fuel:"Gasoline", valve:8)
var v4 = v8
v4.valve = 4

var sportsCar = Vehicle(engine:v8)
sportsCar.capacity = 2
var suv = sportsCar
suv.capacity = 5

//: ### 정답 확인 영역
assert(suv.capacity == 5)
assert(sportsCar.capacity == 2)

assert(sportsCar.engine.valve == 8)
assert(suv.engine.valve == 4)

//: [5번 문제](@next)
