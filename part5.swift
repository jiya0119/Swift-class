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
