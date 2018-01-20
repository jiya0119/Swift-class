import UIKit
let maxSpeed: Int = 200 // type inferring
// maxSpeed += 10
// let으로 정의된 상수는 변경 불가. var로 정의하면 된다.
var currentSpeed: Int = 110
currentSpeed += 10
// currentSpeed += 20.5
// type이 같아야 변경이 된다.


import UIKit
let name: String = "SeongKwan"
var greeting = "Hello"
//문자열도 let과 var로 정의 가능, var 수정 가능
greeting += "" + name

let characters = name.characters
// 문자열 하나하나 array처럼 독립적으로 접근 가능: CharacterView
let count = characters.count
// 몇 글자인지 알 수

let url = "www.codershigh.com"
let hasProtocol = url.hasPrefix("http://") // 결과: false

print("\(name)")
// console에 결과를 찍을 때 문자열을 사용한다. 적당한 변수/ 상수값을 넣으면 결과를 얻을 수 있다
// 문자열 안에 숫자를 넣거나 문자열을 조합해야 할 때 "\()"를 활용하여 문자열 안에 여러 값을 넣을 수 있다.


import UIKit
let maxSpeed: Int = 200 // type inferring
// maxSpeed += 10
// let으로 정의된 상수는 변경 불가. var로 정의하면 된다.
var currentSpeed: Int = 110
currentSpeed += 10
// currentSpeed += 20.5
// type이 같아야 변경이 된다.
//해결 방법: 20.5를 int로 만든다.
currentSpeed += Int(20.5)
// result는 140

let intMax = Int.max // 9223372036854775807
let UintMax = UInt.max // 18446744073709551615
// 정수 표현: 두가지 - Int와 UInt
// UInt: unsigned int - 마이너스값이 없는 정수
// 결과: Unit가 int의 두 배

// 반대로 min값
let intMin = Int.min // -9223372036854775807
let UintMin = UInt.min //0
// int는 반대방향으로 마이너스, uint는 0: 부호를 가지지 않은 정수 값

// Int.max: Swift에서 표현할 수 있는 정수 중 가장 큰 수
// Int.min: Swift에서 표현할 수 있는 정수 중 가장 작은 수

// UInt.max: Swift에서 표현할 수 있는 양의 정수 중 가장 큰 수
// UInt.min: Swift에서 표현할 수 있는 양의 정수 중 가장 작은 수

let pi = 3.14
//double
let divider = 2
// let halfPi = 3.14/divider // error: double값을 정수값인 divider로 나눴기 때문
// divider를 double로 만들어 주면 됨.
// 정수는 정수끼리. 소수는 소수끼리 연산 - 어느 한 쪽으로 타입을 변경
let halfPi = 3.14/Double(divider) // 또는 let halfPi = 3.14/2


//tuple을 이용해 데이터 구조 만들기
import UIKit
let time1 = (9, 0, 48) // 9시 0분 48초 // 세 개의 integer
time1.0 // 결과: 9
// tuple의 강력한 장점: integer, string, float 어떤 것이든 섞여도 상관 없다.
let time2: (h: Int, m: Int, s: Int) = (11, 51, 5) // 이름을 줌
time2.h // 결과: 11
time2.m // 결과: 51
time1.2 // 결과: 48
// 이름이 있으면 숫자 인덱스보다 편하고 직관적이다.

// tuple 안에 tuple도 가능
let duration = (time1, time2) // 결과: ((.0 9, .1 0, .2 48),(.0 11 .1 51 .2 48))
// 정의된 tuple 값을 어딘가에서 받아왔다면 하나하나의 값을 읽어낼 수 있음
let (start, end) = duration // start값과 end 값은 duration에서 얻어온다.
let endHour = end.h // 결과: 11
// 즉시 원하는 값을 정의하고 정의된 값을 index 또는 정의할 때 썼던 문자열을 통해 꺼내쓸 수 있음
// typealias와 사용하면 활용도가 높아짐. 물론 tuple하고만 쓸 수 있는 건 아님.
// 언제 어디에서나 직접 간단한 type를 지정이 가능
// 예를 들어 int type으로 시간 간격을 나타내고 싶으면
// 사실은 int인 timeInterval 값을 만들어 쓸 수 있음
// typealias 여기저기서 많이 이용됨
typealias Time = (h: Int, m: Int, s: Int)
// Time이라는 튜플은 이런 값을 가진다.
typealias Duration = (start: Time, end: Time)
// start와 end의 time tuple로 구성됨

let today: Duration = ((9, 10, 23), (17, 8, 21))// today의 타입은 duration
print (“We studied until \(today.end.h) today“)

tuple와 typealias를 같이 사용하면 간편하게 값의 묶음을 만들 수 있고 편리하게 묶음에서 값을 빼낼 수 있다.


//array
import UIKit
//array: 순서를 가지고 있는 같은 타입 값들의 배열. object를 넣으면 인덱스가 올라가면서 쌓인다. object가 모여있는 것

var meetingRooms: Array <String> = ["Bansky", "Rivera", "Kahlo", "Picasso", "Cezanne", "Matisse"]
// object들을 comma로 구분해서 넣는다.
var groups:[Int] = [10, 8, 14, 9]

meetingRooms += ["Renoir"]



/*

let maxSpeed: Int = 200
var currentSpeed: Int = 200
currentSpeed += 10

var speedHistory: [Int] = []
speedHistory += [CurrentSpeed]
let gpsSpeed0901 = 114.1
speedHistory.append(Int(gpsSpeed0902))

speedHistory[1] //114
speedHistory.first //120
speedHistory.last //114

let historyBackup = speedHistory
//이때 바로 복사되지 않음. 두 array 중 하나가 변하는 때 복제본이 생기는 것
speedHistory +=150 // [120, 114, 150]
historyBackup // [120, 114]

*/


// var roomCapacity: [String: Int] = [:] //비어있는 상태로 초기화
var roomCapacity: [String:Int] = ["Bansky":4, "Rivera":8, "Kahlo":8, "Picasso":10, "Cezanne":20, "Matisse":30]

// roomCapacity += ["Renoir": 40] // 이렇게 하면 에러남
roomCapacity["Renoir"] = 40
roomCapacity["Kahlo"] //8

/*
// 회의실 이름만 얻어오고 싶다.
let roomNames = roomCapacity.keys
// 언뜻 보면 이것은 array처럼 보임. 그러나 아님. - LazyMapCollection 형태(일종의 튜플)
// 완전한 array를 얻어오고 싶다 하면
let roomNames = [String](roomCapacity.keys)
*/

let capacities = roomCapacity.values
let capacities = [Int](roomCapacity.values)

let total = capacities.reduce(0, combine: +)

// set
// 순서가 없는 collection
// 집합연산 하기 좋다
// 4가지: Intersect, Subtract, union, exclusiveOr

let subway2: Set = ["시청", "을지로입구", "을지로3가", "을지로4가", ...]
let subway3: Set = ["지축", "구파발", "연신내", "불광", ...]

let transfer = subway2.intersect(subway3)
let notTransfer = subway2.subtract(subway3) // 환승되지 않는 역들

let union = subway2.union(subway3)
let exOR = subway2.exclusiveOr(subway3)


// 흐름 제어: if, for, switch
// if: 조건에 따른 분기문

if transfer.count > 0 {
  print ("환승역은 \(transfer)입니다.") //"환승역은 ["을지로3가", "교대"]입니다.\n"
} else {
  print("환승역은 없습니다.")
}

// for: 범위 또는 컬렉션에 대한 반복

/*

for i = 0; i< count; i++ {
  ...
}

for item in collection {
  ...
}

*/

for station in subway2 {
  print("이번 역은 \(station)입니다.")
}

// switch문: 하나의 값에 대한 다양한 경우에 대한 매칭

/*
switch value {
  case a: // value가 a인 경우에 실행할 구문
  ...
  case b: // value가 b인 경우에 실행할 구문
  ...
  default: // a도 b도 아닌 그 외의 경우에 실행할 구문
  ...
}
*/

for (roomName, capacity) in roomCapacity{ //dictionary를 for문으로 돌릴 때는 tuple로 값을 받아올 수 있다.
//roomCapacity 안에 있는 key와 value의 쌍이 roomName과 capacity로 하나하나 들어감.
  let roomDescription: String // let이지만 바로 아래에서 내용을 채워넣는 경우 var를 쓰지 않아도 됨. let도 됨
  switch capacity {
    case 4:
      roomDescription = "\(roomName)은 스터디 룸이며 정원은 \(capacity)명입니다."
    case 5...10: // ....: range expression - 어떤 값의 범위를 표현
      roomDescription = "\(roomName)은 팀 세미나 룸이며 정원은 \(capacity)명입니다."
    case 11...30:
      roomDescription = "\(roomName)은 그룹 세미나 룸이며 정원은 \(capacity)명입니다."

    // case let caseCapacity where caseCapacity> 30: // 새로운 caseCapacity 정의. 어떤 경우에? 저 caseCapacity가 30보다 클 때에.
    // 새롭게 정한 caseCapacity는 필요 없는 상수처럼 보임. 이런 경우 _를 이용하여 생략할 수 있음.
    case _ where capacity > 30:
      roomDescription = "\(roomName)의 정원은 \(capacity)명이며 별도의 사용신청이 필요합니다."
    // switch 문은 모든 경우를 다 포함해야 함. 여기까지만 적으면 에러 남.
    // 정해진 범위를 모두 만족하거나, default 값이 있어야 함.
    default: // 4보다 작은 회의실. 우리 회사에는 그런 회의실 없어요. 정보를 다시 확인해주세요
      roomDescription = "\(roomName)의 정보를 다시 확인해주세요"
  }

}


//optional: 값이 없는 상태
//Nil: '값이 없음'을 나타냄. 모든 타입에서 사용이 가능함. 모든 타입의 변수는 nil이 될 수 있음.
//optional: 안전을 위한 장치. 실행 중 Nil이 될 수 있는 변수에 ?를 붙여 특별히 관리.  compile할 때 특별관리 하기 위함.

import UIKit

// var title: String = nil // title이라는 문자열 변수가 nil로 생성되고 나중에 값을 가진다. 하고 nil 값을 넣으면 에러가 남.
// 왜냐면 title은 옵셔널이 아니기 때문. title을 옵셔널로 지정해 주면..

// var title: String? = nil //nil이 들어갈 수 있음.
// 변수 타입 뒤에 물음표를 넣으면 optional로 정의되는 것. title은 실행 중에 nil이 될 수 있는 변수이기 때문에 특별히 관리됨.
// title = "Storyboard Prototyping" // 나중에 title에 값을 넣어줄 수 있음.

var title: String = "Storyboard Prototyping"
// 책 제목은 반드시 있어야 하기 때문에 optional이면 안됨.
var ratings: [Int]? = nil
var supportURL: String? = nil
// 이 상태에서 책 제목을 프린트해본다.



//print("\(title) has \(ratings.count) ratings. \r\nsupport web page : \(supportURL)")

// \(ratings.count) ratings : 몇 건의 rating이 있고
// \r\n : 한 줄 띄우는 것.



// print에 error가 뜸: 우리가 두 개의 변수를 optional로 선언했는데 어떻게 저 변수들을 사용할지..



// optional의 접근법(optional로 정의한 변수를 사용하는 방법)


// force unwrapping: !
// optional을 사용할 때 느낌표로 사용함.
// 값의 존재를 확신할 때에만 사용해야(값을 확인해야 함). 정확히 확인하지 않고 남발하면 crash가 나버림.
// crash operator라는 오명
// 느낌표 남발은 optional을 무력화시키고 opitonal의 존재의미를 퇴색시키는 것.

var bookDescription: String = "\(title)"
if ratings != nil {
  bookDescription += "has \(ratings.count) ratings"
  // 이때 force unwrapping을 하라는 유혹.. 이때는 ㄱㅊ 왜냐면 nil이 아닐 때니까.
}



/*


if supportURL != nil {
  bookDescription += "\r\nsupport web page: \(supportURL!)" //느낌표가 없으면
  //print("\(bookDescription)")의 결과는
  // Storyboard Prototyping
  // support web page: Optional("www.codershigh.com")
}

print("\(bookDescription)") //그럼 일단은 "Storyboard Prototyping\n"만 프린트됨.

// 만약에 저 var supportURL 밑에 supportURL = "www.codershigh.com"을 적어 주면 이것도 프린트됨
// Storyboard Prototyping
// support web page: www.codershigh.com



*/


// optional binding: if let, if var - 옵셔널이 아닌 새로운 상수와 변수 생성
//앞선 코드에서는 옵셔널이 아닌데도 느낌표를 쓰지 않으면 결과에 옵셔널이라고 나와버림.
//우리는 가능한 느낌표를 없애고 싶음.
//느낌표는 잠재적으로 크래쉬를 일으킬 가능성이 높은 코드.

if let theRatings = ratings { //ratings에 값이 있는지 확인한 뒤에 값이 있는 경우에만 theRatings에 값이 들어감.
//theRatings는 옵셔널이 아닌 상수임.
  bookDescription += "has \(theRatings.count) ratings"
}
if let theURL = supportURL {
  bookDescription += "\r\nsupport web page: \(theURL)"
}

//supportURL에 내용물이 있는지 확인한 뒤에 theURL이라는 옵셔널이 아닌 상수로 넣어줌.
//theURL은 if문 내에서는 옵셔널이 나닌 것처럼 사용 가능.





// implicitly unwrapped optional: 선언시 !사용
// 옵셔널을 쓰다 보면 if let 또는 느낌표를 써야 함. 코드가 온통 if let 내지는 느낌표가 돼버림.
// 이런 것을 방지하기 위함.
// 어떤 변수가 초기에 잠깐 nil인 상태로 초기화되기 때문에 어쩔 수 없이 옵셔널로 선언을 했지만
// 애플리케이션이 동작하는 중에는 반드시 값을 가진다. 항상 값이 존재한다
// 이런 경우 force unwrapping이나 optional binding을 피하기 위해 선언할 때 느낌표를 사용.
// 위의 supportURL은 처음에 잠깐 nil이었지만 곧바로 값을 가짐.
// 그래서 밑에서 force unwrapping이나 optional binding은 조금 불편하다.
// 처음에 nil을 갖지만, 어쩔 수 없이 옵셔널이지만
// 프로그램 동작 초창기에 반드시 값을 가지게 됨. 절대 nil을 갖지 않음
// 하면 선언할 때 물음표 대신 느낌표를 쓴다.
// 그러면 optional binding을 하지 않아도 됨.
// 바로 bookDescription에 supportURL을 마치 옵셔널이 아닌 것처럼 쓸 수 있음.

// 바꾼 코드

import UIKit

var title: String = "Storyboard Prototyping"
var ratings: [Int]? = nil
var supportURL: String != nil

supportURL = "www.codershigh.com"

var bookDescription: String = "\(title)"
if let theRatings = ratings {
  bookDescription += "has \(theRatings.count) ratings"
}
//if let theURL = supportURL {
//  bookDescription += "\r\nsupport web page: \(theURL)"
//}
bookDescription += "\r\nsupport web page : \(theURL)"

print ("\(bookDescription)")


//구조적으로 초기화 이후 항상 값이 존재하는 경우를 위한 편의장치



//함수
//입력값이 들어가면 출력값이 나온다.
//함수가 모여있는 것: 라이브러리, api

/*

func functionName(parameter: Type) -> returnType {
  ...
  return ...
}
func functionName () {
  ...
}

*/

func myFunction () -> Void { //매개변수가 없고 return type도 void
//여기서 -> Void는 생략 가능.

}

//호출할 때
myFunction ()
//myFunction 내부의 코드가 실행되는 결과를 얻음.

//앞선 코드를 완성해 보자.
import UIKit
var title: String = "Storyboard Prototyping"
var ratings: [Double]? = nil
var supportURL: String! = nil

supportURL = "www.codershigh.com"
ratings = [4.5, 3.0, 5.0, 2.5]

func ratingRecord (history: [Double]) -> (average: Double, min: Double, max: Double) {
  var sum = 0.0, min = history[0], max = history[0]

  for value in history {
    if min > value {min = value}
    if max < value {max = value}
    sum += value
  }
  let average = sum / Double (history.count) //history.count가 int라서 double로 만들어줌.
  return (average, min, max)
}

var bookDescription: String = "\(title)"
if let theRatings = ratings {
  let record = ratingRecord(theRatings)
  bookDescription += "has \(theRatings.count) ratings, \r\n average is \(record.average), from \(record.min) to \(record.max)"
}






































//: Playground - noun: a place where people can play

/*
import UIKit


let array = [1,2,3,4,5]

var retArray: [String] = []
for item in array {
    let str = String(item)
    retArray.append(str)
}


func aaaa(a: Int) -> String {
    return String(a)
}
let ret = array.map(aaaa)
print(ret)







var retArray2: [Int] = []
for item in array {
    if item in array {
        if item < 3 {
            retArray2.append(item)
        }
    }
}

let ret2 = array.filter {(a:Int) -> Bool in
    return a < 3
}


var sum =  0
for item in array {
    sum += item
}

let sum2 = array.reduce(0) { (ret: Int, item: Int) -> Int in
    return ret + item
}
*/


//Structure(구조체)
//구조체를 정의하고 그 인스턴스를 만들어 본다.

//구조체:
//데이터와 함께 데이터 모델의 중요한 구성 요소
//변수/상수/함수를 선언한 뒤 인스턴스를 만들어 사용
//좌표/크기 등 간단한 값을 표현



/*


import UIKit

Struct Task {
  var title: String?
  var time: Int?
}
//구조체를 만든다는 것은..
//해결해야 하는 프로그래밍적인 작업을 추상화하는 것
//우리가 만든 task라는 구조체에서는
//task의 이름은 문자열,
//task를 완료하기까지 걸리는 시간은 time이라는 int값으로 가지고 있을 것
//optional로 정의된 변수들은 내부적으로 초기화 시
//nil값이 할당됨

var callTask = Task(title: "Call to Randy", time: 10*60)
//전화업무. Task이라는 구조체에, "Call to Randy"라는 업무. 10분이 할당됨
//구조체 Task 안에 정의해 놓은 변수 두개가 모두 옵셔널이기 떄문에
//하나의 Task를 더 만든다.
var reportTask = Task ()
//Task라고만 초기화함.
//여기서는 title, time이 모두 nil
reportTask.title = "Report to Boss"
//todayTask라는 Task로만 이뤄진 array를 만든다.
var todayTask: [Task] = []
todayTask += [callTask, reportTask]



*/



//Task라는 구조체에 title과 time을 옵셔널로 만들어두고 생각해보니
//time은 옵셔널이어도 title은 옵셔널이면 안될 거 같음
//그래서 title의 옵셔널을 뺌
//title은 옵셔널이 아니기 때문에 기본값을 제공해야 함.
//time은 nil일 수 있음.

import UIKit

struct Task {
  var title: string
  var time: Int?
}

var callTask = Task (title: "Call to Randy", time: 10*60)

var reportTask = Task (title: "Report to Boss", time: nil)

var todayTask: [Task] = []
todayTask += [callTask, reportTask]
todayTask[1].time = 15*60 //값이 들어감

print("today task = \(todayTask)")



//value type
//할당시 값을 복사. 메모리 번지를 공유하지 않음

//구조체는 value type임

//array 등 컬렉션이나 다른 변수에 구조체를 할당하면
//그 순간 값이 복사됨

//우리는 todayTask에 callTask와 reportTask를 넣음
//넣은 뒤(할당한 뒤) callTask의 title을 변경함
//그러나 todayTask에는 여전히 원래 title이 들어가 있음.



//클래스


//데이터 모델의 중요한 구성요소

//오브젝트를 생성

//참조로 동작
//오브젝트가 array나 다른 변수에 할당될 때 복사되지 않고
//그 주소값만 공유됨

//구조체에서는 값이 복사됨

import UIKit

struct Task {
  var title: String
  var time: Int?

  var owner: Employee
  var participant: Employee?

}

class Employee {
  var name: String?
  var phoneNumber: String?
  var boss: Employee? //동일한 Employee라는 클래스
}

let me: Employee = Employee()
me.name = "Alex"
me.phoneNumber = "010-1234-5678"

let toby = Employee() //Employee 오브젝트가 만들어짐.
toby.name = "Toby"
toby.phoneNumber = "011-5678-1234"

//me 오브젝트와 toby 오브젝트를 let으로 선언함.
//앞서 구조체의 인스턴스 만들 때 let으로 만들면 수정이 불가했음
//하지만 클래스에서는 가능

var callTask = Task (title: "Call to Randy". timeL 10*60, owner: me, participant:nil)
var reportTask = Task(title: "Report to Boss", time: nil, owner: me, participant: nil)

//structure와 class는 서로 다른 타입의 인스턴스를 만듦
//상수로 structure instance를 만들면 수정할 수 없음
//그래서 항상 변수로 정의해야
//하지만 클래스 오브젝트는 상수로 만들어도 그 내부의 값이 변수라면
//employee에 me라는 상수를 만들었다 하더라도
//내부의 name, phoneNumber, boss가 변수이기 때문에 수정 가능
//structure는 할당될 떄 복사됨
