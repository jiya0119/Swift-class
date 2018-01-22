//: [1번 문제](@previous)

/*:
# 2번 문제
## Queue 구조체 만들기
#### 20점
 
다음과 같이 문자열로 동작하는 Queue 구조체를 완성하라.
 
 큐(queue)는 컴퓨터의 기본적인 자료 구조의 한가지로, 먼저 집어 넣은 데이터가 먼저 나오는 FIFO (First In First Out)구조로 저장하는 형식을 말한다. 영어 단어 queue는 표를 사러 일렬로 늘어선 사람들로 이루어진 줄을 말하기도 하며, 먼저 줄을 선 사람이 먼저 나갈 수 있는 상황을 연상하면 된다.
 
 나중에 집어 넣은 데이터가 먼저 나오는 스택과는 반대되는 개념이다.
 
 프린터의 출력 처리나 윈도 시스템의 메시지 처리기, 프로세스 관리 등 데이터가 입력된 시간 순서대로 처리해야 할 필요가 있는 상황에 이용된다.
 
Complete the Queue structure that receives String
*/

import Foundation

struct Queue {
    var queueArray:[String] = []
    
    mutating func enqueue (element:String) {
        queueArray.append(element)
        
    }
    
    mutating func dequeue() -> String? {
        if let first = queueArray.first{
            queueArray.remove(at:0)
            return first
        }
        return nil
//        return queueArray.removeFirst()
    }
}

var newQueue = Queue()
newQueue.enqueue(element: "Leonard")
newQueue.enqueue(element: "Sheldon")
newQueue.enqueue(element: "Penny")
newQueue.enqueue(element: "Howard")
newQueue.enqueue(element: "Rajesh")

//: ### 정답 확인 영역
let firstOne = newQueue.dequeue()
assert(firstOne == "Leonard")
let secondOne = newQueue.dequeue()
assert(secondOne == "Sheldon")

//: [3번 문제](@next)
