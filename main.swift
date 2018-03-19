import Foundation



print("\n\n#lesson 1 - Constant, Variable \n")

// Swift는 문장의 끝에 세미콜론을 쓰지 않습니다
// main()함수는 없습니다
// C와 같은 file dependency는 없습니다
// 대신 module 을 가져옵니다
// 상수(변경불가)는 let으로, 변수는 var로 선언 합니다
let CONSTANT_INT : Int = 10
var variableInt : Int = 10

// value type은 자동으로도 찾아 줍니다
let CONSTANT_STRING = "const"
var variableDouble = 12.3
var variableString = "variable"

// 하지만 type이 한번 정해지고 나면 다른 type의 값을 넣을 수 없습니다
// variableDouble = "variable"   // error
// 처음 선언할때에 type을 적어주게 되면 혼란이 없겠죠
var intValue : Int = 1

// 표준출력은 print함수를 씁니다
print("hi")

// 표준출력시 변수를 담는 방법은 이러합니다
var numberPrintValue = 5
var stringPrintValue = "입니다"
print("출력하려는 값은 \(numberPrintValue) \(stringPrintValue)")

// swift의 기본형은 빈값(nil)을 담을 수 없습니다.
// 빈값을 담을 수 있는 Optional type이라는 것이 별도로 존재합니다
// 자료형 뒤에 ?를 붙여 선언합니다
var optValue : String? = nil
optValue = "optional type"
print(optValue) // 직접사용이 불가. 컴파일중 warning이 뜹니다
print(optValue!) // 이렇게 강제로 unwraping()합니다
// Optional 타입 선언시 자동 unwraping이 되도록 하려면 !를 이용합니다
var optAutoChange : String! = nil
optAutoChange = "auto casting optional type"
print(optAutoChange)





print("\n\n#lesson 2 - Array \n")

// 컬렉션의 종류에는 Array, Dictionary, Tuple, Set 이 존재합니다
// Array는 다음과 같이 생성할 수 있습니다
var strArray = ["A", "B", "D"]
var strArrayWithType : [String] = ["A", "B", "C", "D", "E", "F", "G"]
var strArrayFromObject = Array<String>(["A", "B", "D"])
var emptyArray : [Int] = []
var emptyArrayWithType = [Int]()
var emptyArrayFromObject = Array<Int>()

// 내용은 통째로 출력이 가능합니다
print(strArray)

// Array가 비어 있는지를 확인할 수 있습니다
if(emptyArray.isEmpty){
    print("비어있어요")
} else {
    print("내용있어요")
}

// index를 통해 마음껏 열람, 수정, 추가, 삭제할 수 있습니다
// 열람
print(strArray[0])

// 수정
strArray[1] = "C"
print(strArray)

// 마지막에 추가
strArray.append("E")
print(strArray)
strArray += ["F"]
print(strArray)

// 특정 index번호에 추가
strArray.insert("B", at: 1)
print(strArray)

// 마지막 삭제
strArray.removeLast()
print(strArray)

// index로 찾아 삭제
strArray.remove(at: 1)
print(strArray)

// index 지정은 범위를 이용할 수도 있습니다
print(strArrayWithType[1..<3])
print(strArrayWithType[1...3])

// 한꺼번에 수정하는 기능도 있습니다
strArrayWithType[1...3] = ["value", "is", "changed"]
print(strArrayWithType)

// 다중으로 사용할 수 있습니다.
var multiArr = [["A", "B", "C"], strArray, strArrayWithType]
print(multiArr)
print(multiArr[1])





print("\n\n#lesson 3 - Dictionary \n")

// Dictionary는 key:value 형태의 Collection 입니다
var foodDic = ["김밥": 2000, "라면": 3000, "떡볶이": 2500]
print(foodDic)

// Dictionary의 요소는 Optional type이기 때문에 !를 붙여야 합니다
print(foodDic["라면"]!)

// 역시 만들때부터 type을 지정할 수 있습니다.
var emptyDicWithType : [String : String]
var emptyDicFromObject : Dictionary<String, String>

// 크기는 이렇게 구합니다
print(foodDic.count)

// key를 가지고 직접 value를 변경할 수 있습니다
foodDic["김밥"] = 1500
print(foodDic)

// 다중으로 사용하는 것이 가능합니다.
var foodDicDic = ["분식": foodDic, "양식":["피자": 8000, "스테이크": 7000]]
print(foodDicDic)
print(foodDicDic["양식"]!)
print(foodDicDic["분식"]!["라면"]!)

// Optional Type이라 nil을 넣어 해당 key-value를 제거할 수 있습니다
foodDicDic["분식"]!["떡볶이"] = nil
print(foodDicDic["분식"]!)













print("\n\n#lesson - Protocol")

// Protocol은 타 언어의 Interface 기능과 거의 유사합니다.
// 기능을 선언만 하고, 구현은 나중에 하는 경우 사용합니다.
protocol Cafe{
    func dripCoffee()
}

// 실제 구현은 클래스에서 하게 됩니다.
class Starbucks: Cafe{
    func dripCoffee() {
        print("Coffee drip!")
    }
}

protocol Restaurant{
    func cook()
}

// 프로토콜끼리의 상속이 가능합니다.
protocol Hotel: Cafe, Restaurant{
}

// 상속된 경우 당연히 모든 프로토콜에서 선언한 메소드를 다 구현해 주어야 합니다.
class HiltonHotel: Hotel{
    func dripCoffee() {
        print("Coffee drip!")
    }
    
    func cook() {
        print("Cooking!")
    }
}

// 프로토콜 내 프로퍼티를 선언할 수 있습니다.
protocol CoffeeMaker {
    var grinder: Int{ get set }
}

// 클래스가 아닌 구조체로 상속받아 사용할 수도 있습니다.
// 즉, 데이터 구조에서 상속관계를 형성할 수 있습니다.
struct CoffeeMakingTools: CoffeeMaker {
    var grinder: Int
}

// 물론 클래스로 사용할 수도 있습니다.
class EsspressoMachine: CoffeeMaker {
    var grinder: Int{
        get{
            return 0
        }
        set{
        }
    }
}

// protocol에서 initializer의 형태를 강제할 수 있습니다.
protocol Oven {
    init(type: String)
    func turnOn()
}

// 상속받은 initializer를 구현하려면 required를 붙여야 합니다.
class MiniOven: Oven {
    required init(type: String){
    }
    func turnOn() {
        print("on")
    }
}

// 클래스가 아닌 프로토콜을 타입으로 지정하여 객체를 생성할 수가 있습니다.
// 이 경우 강제적으로 프로토콜에 선언된 변수와 기능만 이용할 수 있습니다.
var microwaveOven : Oven = MiniOven(type: "전자렌지")
microwaveOven.turnOn()






print("\n\n#lesson - Extension")



































