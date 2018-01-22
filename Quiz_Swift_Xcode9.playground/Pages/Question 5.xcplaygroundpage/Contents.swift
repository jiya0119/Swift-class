//: [4번 문제](@previous)

/*:
# 5번 문제
#### 40점 (10 + 10 + 20)
아래 도표는 한국프로야구 역대 타자 순위이다.

![KBO 역대 타자순위](kbo_hitters.png)

 정답 확인 영역의 에러가 없도록 아래 클래스를 구성하고 문제에서 제시하는 코드를 구현하라.
 */

import Foundation

struct Hitter {
    let name:String
    let team:Team
    let average:Double
    let year:Int
}

enum Team {
    case Haetae
    case MBC
    case Samsung
    case Nexen
    case NC
    case LG
    case Lotte
}

let baek_1982 = Hitter(name: "백인천", team:.MBC, average: 0.412, year: 1982)
let lee_1994 = Hitter(name: "이종범", team:.Haetae, average: 0.393, year: 1994)
let jang_1987 = Hitter(name: "장효조", team:.Samsung, average: 0.387, year: 1987)
let tames_2015 = Hitter(name: "테임즈", team:.NC, average: 0.381, year: 2015)
let jang_1985 = Hitter(name: "장효조", team:.Samsung, average: 0.373, year: 1985)
let ma_1999 = Hitter(name: "마해영", team:.Lotte, average: 0.372, year: 1999)
let park_2009 = Hitter(name: "박용택", team:.LG, average: 0.372, year: 2009)
let hong_2009 = Hitter(name: "홍성흔", team:.Lotte, average: 0.371, year: 2009)
let seo_2014 = Hitter(name: "서건창", team:.Nexen, average: 0.370, year: 2014)
let jang_1983 = Hitter(name: "장효조", team:.Samsung, average: 0.369, year: 1983)

let hallOfFame = [baek_1982, lee_1994, jang_1987, tames_2015, jang_1985, ma_1999, park_2009, hong_2009, seo_2014, jang_1983]


//: filer 함수를 이용해 최근 10년 이내의 기록만을 가진 recent 배열을 만들어라.


//: sorted 함수를 이용해 최근부터 오래된 순으로 기록을 나열한 latest 배열을 만들어라.
 
//: reduce 함수를 이용해 전체 평균 totalAverage 값을 구하라.




//: ### 정답 확인 영역
//:비교를 위한 확장 코드
extension Hitter: Equatable {}
func ==(lhs: Hitter, rhs: Hitter) -> Bool {
    if (lhs.name == rhs.name && lhs.average == rhs.average && lhs.team == rhs.team && lhs.year == rhs.year){
        return true
    }
    return false
}

assert(recent == [tames_2015, park_2009, hong_2009, seo_2014])

assert (latest == [tames_2015, seo_2014, park_2009, hong_2009, ma_1999, lee_1994, jang_1987, jang_1985, jang_1983, baek_1982])

assert(totalAverage == 0.38)

//: ## 수고했습니다. 스쿨로지에 파일을 제출하세요.
