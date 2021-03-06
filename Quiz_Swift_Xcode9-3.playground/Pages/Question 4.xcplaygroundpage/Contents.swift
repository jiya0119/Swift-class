//: [3번 문제](@previous)

/*:
 # 4번 문제
 ## 구조체와 클래스
 #### 20점
 
 아래 정답 확인 영역에서 에러가 없도록 하라
 */

//value type(structure) and reference type(class)
//오브젝트: 클래스로 만든 인스턴스

import Foundation

struct Engine {
    let fuel:String
    var valve:Int
}
class Vehicle {
    let engine:Engine
    var capacity = 0
    init(engine:Engine){
        self.engine = engine
    }
}

let v8 = Engine(fuel:"Gasoline", valve:8)
var v4 = v8 //call by value: 할당할 때 복제
v4.valve = 4

let sportsCar = Vehicle(engine:v8)
sportsCar.capacity = 2
//let suv = sportsCar //call by reference: 주소값만
let suv = Vehicle(engine:v4) //새로 만듦
suv.capacity = 5

//: ### 정답 확인 영역
assert(suv.capacity == 5)
assert(sportsCar.capacity == 2)

assert(sportsCar.engine.valve == 8)
assert(suv.engine.valve == 4)

//: [5번 문제](@next)
