//Enum
//Enumerations
//연관성 있는 값들의 그룹을 만들어 type-safe하게 사용
//일련의 값(raw value)을 주지 않아도 됨
//Enum in Swift
//1st-class type: 어디에나 사용될 수 있는 자격을 갖춘 오브젝트
//매개변수, 리턴타입, 컬렉션 등
//특히 class에서나 되던 기능들이 추가
//computed property, method, initializer, conform to protocol
//앞서 만들었던 Task 구조체에 enumeration을 정의해 보자.
import UIKit
struct Task {
  var title: String
  var time: Int?
  var owner: Employee
  var participant: Employee?
  var type: TaskType //type은 방금 정의한 TaskType 중 하나의 값을 가질 것
  enum TaskType {
    case Call
    case Report
    case Meet
    case Support
    //computed property
    var typeTitle: String { //enum 내부에 변수를 정의
    //문자열 타입의 변수이지만 자기가 속해 있는 TaskType의 종류에 따라서
    //접근할 때마다 다른 값을 제공해 주도록 되어있음.
      get {
        let titleString: String //저 문자열은 switch문에 의해서, self의 값에 따라서
        switch self {//self는 enumeration TaskType이다.
          case.Call:
            titleString = "Call"
          case.Report:
            titleString = "Report"
          case.Meet:
            titleString = "Meet"
          case.Support:
            titleString = "Support"
        }
        return titleString
        //외부에서 TaskType enumeration 값을 설정하고 나서
        //그 enumeration의 typeTitle에 접근하면
        //taskType의 값에 따라서 서로 다른 문자열이 return됨
      }
    }
  }
}
class Employee {
  var name: String?
  var phoneNumber: String?
  var boss: Employee?

  init (name: String) {
    self.name = name
  }
  convenience init (name: String, phone: String) {
    self.init(name:name)
    self.phoneNumber = phone

  }
  //이것이 class의 초기화가 구조체같은 value type의 초기화보다 복잡한 면.
  //여러개의 initializer를 만들어 놓고 편리한 것을 쓰면 됨

}
let me: Employee = Employee(name: "Alex")
// me.name = "Alex"
me.phoneNumber = "010-1234-5678"
//...
/*
실제로 사용해보기
task라는 structure 안에 type이라는 변수에 TaskType이라는 enumeration을 선언해 넣었다
그래서 새로운 task를 만들 때마다 타입을 정의해 줘야함
var callTask = Task(title: "Call to Toby", time: 10*60, owner: me, participant: toby, type:.Call)
var reportTask = Task(title: "Report to Boss", time: nil, owner: me, participant: nil, type:Task.TaskType.Report)
*/
//초기화 작업
//모든 stored property들의 최초 값 설정
//stored property: (인스턴스 내부에서)메모리를 차지하는 프라퍼티
//예: employee에 name을 설정한 것
//반대 개념
//computed property: (직접 메모리를 가지고 있지 않으면서)그때그때 계산에 의해 값을 제공하는 프라퍼티
//새 인스턴스를 위한 준비작업에 해당함.
import UIKit
struct Task {
    var title: String
    var time: Int?

    var owner: employee
    var participant: Employee?

    var type: TaskType
enum TaskType {
  case Call
  case Report
  case Meet
  case Support
  //computed property
  var typeTitle: String {
    get {
      let titleString: String //저 문자열은 switch문에 의해서, self의 값에 따라서
      switch self {//self는 enumeration TaskType이다.
        case.Call:
          titleString = "Call"
        case.Report:
          titleString = "Report"
        case.Meet:
          titleString = "Meet"
        case.Support:
          titleString = "Support"
      }
      return titleString
    }
  }
}

init (type: TaskType, owner: Employee) { // Task를 초기화하는 데 있어 필수적인 값
  self.type = type //매개변수
  self.title = type.typeTitle //얻어와서 초기화
  self.owner = owner //매개변수
  self.time = nil //옵셔널
  self.participant = nil
}

//초기화 메소드를 만들었기 때문에 Task 인스턴스를 좀 더 간단하게 만들 수 있음


}
class Employee {
    var name: String

}
//앞서 정의했던 TaskType에서
//typeTitle이 computed property임.
//이 typeTitle은 별도의 메모리 번지를 갖고 있지 않으면서
//그때그때 TaskType의 값에 따라서 특정한 값들을 제공
// 이외의 title, time, owner, participant는 어떤 메모리 영역을 가지고 있는 property
//즉 stored property임
//우리가 만든 Task 구조체와 employee 구조체는 아직 초기화 메소드를 갖고 있지 않음
//그래서 callTask를 만들 때 Task 안에 있는 stored property들을 그때그때 초기화해야만 했음
//좀 더 간편하게 초기화할 수 있도록 Task 안에 init 메소드를 구현해자








//method
//어떤 타입에 종속된 함수
//그 타입으로 만든 인스턴스에서 필요한 작업이나 기능을 함수로 추상화해서 만들어 넣은 것
//class, structure, enumeration은 모두 인스턴스 메소드를 가질 수 있다
//self는 만들어진 인스턴스 그 자신을 가리킴
