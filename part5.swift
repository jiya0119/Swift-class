//function type
//function type를 이용해 함수를 선언할 수 있다.

//1st class citizen
//함수가 1등 시민. 어디든 갈 수 있는 권리가 있다.
//함수는..
//매개변수로 쓰일 수 있음
//리턴타입(리턴될 수 있음)
//변수에 할당될 수 있음

//우리가 아는 Type들
//String, Double, Int - 기본 타입들
//Array, Dictionary, Set - 컬렉션 타입들
//UIView, UILabel, UITableView - CocoaTouch 클래스 타입들

//() -> Void, (Int, Int) -> Int - 함수 타입들
//함수의 형식.. 어떤 매개변수를 받아서 어떤 타입을 리턴한다.
//함수 자체를 하나의 타입으로 선언하는 것


func addTwoInts(a: Int, b: Int) -> Int
{return a+b}
func multiplyTwoInts(a:Int, b: Int) -> Int

var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction(2,3) //5
mathFunction = multiplyTwoInts
mathFunction(2,3) //6




//function type 사용
import UIKit

func addVAT(source:Double) -> Double {
  return source*1.1
}
func couponDiscount(source:Double) ->Double {
  return source*0.9
}

var additional:(Double) -> Double //additional은 함수타입
//함수타입을 변수에 할당해본 것

let transaction032701 = 120.7 //현재 가격
additional = addVAT

let price032701 = additional(transaction032701) //최종가격 132.77



//함수타입을 다른 함수의 매개변수로 사용하기

func finalPrice(source:Double, additional:(Double) -> Double) -> Double {
//additional이라는 매개변수로 Double을 받아서 Double을 return하는 함수를 받음
//최종적으로 Double을 return함.
  let price = additional(source)
  //매개변수로 넘어온 additional이라는 함수에 source값을 넣어서 계산
  //그 계산 결과를 return
  return price
}

let price032702 = finalPrice(350.0, additional: couponDiscount)
//couponDiscount이라는 함수를 매개변수로 넘김.
//결과:315



//closure
//1등시민으로 사용가능한 독립적인 코드조각 (매개변수, return type, 할당 가능)
//자신이 정의된 환경을 캡쳐해서 저장한 뒤, (문을) 닫아버린다.

//closure의 문법
//블록으로 감싸있다
{(params) -> returnType in //in이 나오면 클로저인 것!!!!!!!!
  statements //매개변수를 이용해서 returnType을 만들어내는 구문
}

//클로저는 생략, 축약이 가능, in이 생략되기도.
//가능한 짧게 만들어야 함.

//param은 이름이 아니라 위치로 참조해서 생략
//returnType은 명백한 경우 생략
//addVAT와 couponDiscount를 클로저로 만들어보자.

let addVATClosure = { (source: Double) -> Double in
  return source * 1.1
}

let addVATClosure2 = { source in //type과 returnType생략
  return source * 1.1
}

let addVATClosure3 = { source in
  source * 1.1 //return도 생략
}

let addVATClosure4 = { $0*1.1}

let couponDiscountClosure = {(source: Double) -> Double in
  return source * 0.9
}

let couponDiscountClosure2 = {$0 * 0.9}
let price032703 = addVATClosure(157.6) //173.36


//함수를 리턴하는 함수
func makeAdder (x: Int) -> (Int) -> Int{ //x를 받고 int를 받아서 int를 리턴
//함수 안에서 함수 정의 가능. 함수 안에서만 쓰는 함수
  func adder(a: Int) -> Int {
    return x + a
  }
  return adder
}

// 정수를 받아서, 정수를 리턴하는 함수를 리턴하는, 함수를 만들어주는 함수

let add5 = makeAdder(5) //함수
let add10 = makeAdder(10) //함수

//그래서 이 둘에는 추가적인 매개변수를 넣어야 함

print(add5(2)) //7
print(add10(2)) //12


//다른 방식
//adder를 함수 말고 클로저로 만들어 리턴하기
func makeAdder2 (x: Int) -> (Int) -> Int{
  let adder: (Int) -> Int = {
    return $0 + x
  }
  return adder
}



func makeAdder3 (x: Int) -> Int -> Int { //매개변수 괄호 생략 가능
  return { //adder를 리턴하는데 이 이름이 필요 없음
    return $0 + x //넘어오는 매개변수에 x를 더해서 리턴
  }
}

print(makeAdder3(5)(2)) //makeAdder3(5) 함수에 2를 대입한 것 //7


//고차함수: 함수를 매개변수로 받는 것

//함수 매핑하기
//배열의 항목에 함수 적용하기
//[a,b,c,d,e].map{f(x)}를 하면
//[f(a),f(b),f(c),f(d),f(e)]

let transactions = [560.0, 321.5, 190.0, 672.8, 1190.0, 450.0]

func addVAT(source:Double) -> Double {
  return source*1.1
}

var vatPrices:[Double] = []

for transaction in transactions {
  vatPrices += [addVAT(transaction)]
}


let vatMapPrices = transactions.map({ transaction -> Double in //클로저
  return transaction*1.1
})

let vatMapPrices2 = transactions.map({$0 * 1.1})



//filter
//조건문 대체 가능
//조건문을 단순화
//배열에 적용하는 함수
//조건이 들어간 함수를 배열 각각 요소에 적용, 조건에 맞는 것만 골라 새 배열 만듦
//컬렉션의 항목들 중 조건에 맞는 항목만 찾아내기
//[a,b,c,d,e].filter{x>100}를 하면 100보다 큰 항목들로 이뤄진 배열 리턴

//큰 transaction들로만 이뤄진 배열 만들기
var bigTransactions:[Double] = []

for price in vatPrices {
  if price >= 500 {
    bigTransactions += [price]
  }
}


let bigFilterTransactions = vatPrices.filter{$0 >= 500}

var meetingRooms: [String: Int] = ["Bansky":"4", "Rivera":"8","Kahlo":"8", "Picasso":"10", "Cezanne":"20", "Matisse":"30"]
let members = 9
let available = meetingRooms.filter{$0.1>members}

//filter는 보통 배열에 적용함.
//딕셔너리에도 가능. 딕셔너리는 튜플처럼 접근 가능
//하나하나 요소에 접근. 0은 string 1은 정수
//저 딕셔너리의 value가 members보다 큰 meetingRoom만 남겨서 새로운 딕셔너리 만듦

//available이라는 컬렉션은 딕셔너리가 아님 튜플로 구성된 것
//0번 또는 1번. 튜플로 접근함

print("\(available)")
//[("Cezanne", 20), ...]

print ("\(available[0])")
//("Cezanne", 10)

//딕셔너리가 배열이 아니기 때문에 filter를 적용하면 튜플로 이뤄진 배열로 바뀜


//sort
//컬렉션의 항목들을 조건에 맞게 순서를 바꾸기
//[a,b,c,d,e].sort{$0>$1}을 하면 큰 항목이 앞으로 오는 정렬이 됨

func ascendantSort (sort1: Double, sort2: Double) -> Bool {
  return sort1 > sort2
}

let sortedPrices = vatPrices.sort(ascendantSort)
//sort에는 정렬의 기준이 되는 함수를 넣음.

//클로저로 간략하게
let sortedPrices2 = vatPrices.sort({sort1, sort2 in
  return sort1 > sort2
})

//클로저를 더 간략하게
let sortedPrices3 = vatPrices.sort({$0 > $1})

let sortedPrices4 = vatPrices.sort( > )


let sortedMeetingRooms = meetingRooms.sort({$0.1 > $1.1}) //value끼리 비교


//sort는 정렬 기준이 들어가 있는 함수를 매개변수로 받아서
//특정 배열을 원하는 순서대로 정렬해줌


//reduce 함수
//하나의 값으로 수렴
//컬렉션의 항목들을 조건에 따라 하나의 값으로 만들기
//[a,b,c,d,e].reduce(초기값, combine: +)를 하면
//배열의 모든 값이 더해진 하나의 값 리턴
//조건은 combine이라는 매개변수에 함수로 들어감

//reduce함수는 우리의 작업을 좀 더 간단하게 만들어주는 범용함수

func priceSum (base: Double, adder: Double) -> Double {
    return base + adder
}

var sum: Double = 0.0
for price in vatPrices {
    sum = priceSum (sum, adder: price) //지금까지의 sum값을 매개변수로 넘겨주고 이번에 더할 값을 또 매개변수로 넘겨줌
    //그러면 base에 adder가 더해져서 새로운 sum이 나올 것
}


//reduce로 간단하게 만들기
var sum2: Double = 0.0
let sumReduce = vatPrices.reduce(sum2, combine: priceSum)

//더 간단하게
let sumReduce2 = vatPrices.reduce(0.0, combine: {base, adder in
    base + adder})

//축약된 reduce
let sumReduce3= vatPrices.reduce(0.0. combine: +)

//reduce는 문자열도 가능
let pricesInString = vatPrices.reduce("", combine: {$0 + "\($1)\n"})
//$0: 첫번째 위치참조 변수에는 base값이 들어감. 다음에는 거기에 더할 adder가 들어가고.

let descriptionString = meetingRooms.reduce("We have meeting rooms: \n",
                                            combine: $0 + "\($1.0) for \($1.1) person \n")
//딕셔너리를 이용하여 문자열을 만들어봄.
