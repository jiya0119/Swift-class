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

let addVATClosure4 = { $0* 1.1}

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

정수를 받아서, 정수를 리턴하는 함수를 리턴하는, 함수를 만들어주는 함수

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
