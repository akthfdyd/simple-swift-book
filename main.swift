import Foundation



print("\n\n#lesson 1 - Constant, Variable \n")

// Swift는 문장의 끝에 세미콜론을 쓰지 않습니다
// main()함수는 없습니다
// C와 같은 file dependency는 없습니다
// 대신 module 을 가져옵니다

// 상수(변경불가)는 let으로, 변수는 var로 선언 합니다
let CONSTANT_INT : Int = 10
var variableInt : Int = 10

// 이름은 영문이 아니어도 유니코드로 작성 가능합니다. 그러나 자제해야겠지요
var 변수 = "var"
print(변수)

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

// swift의 기본자료형은 빈값(nil)을 담을 수 없습니다.
// 빈값을 담을 수 있는 Optional type이라는 것이 별도로 존재합니다
// 자료형 뒤에 ?를 붙여 선언합니다
var optValue : String? = nil
optValue = "optional type"
//print(optValue) // 직접사용이 불가! 컴파일중 warning이 뜹니다
print(optValue!) // 이렇게 강제로 unwraping()합니다

// 강제언래핑의 위럼을 줄이려면? 값을 일반 자료형으로 복제하여 검사를 해야겠지요
if let op2 = optValue{
    print(op2)
}

// 기본값을 쓰려면 다음과 같이 사용합니다.
let op1 = optValue ?? "" // 값이 없으면 ""를 기본값으로 대입
print(op1)

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





print("\n\n#lesson 4 - Loop \n")

// swift에서의 Loop는 크게 데이터 집단에 대한 반복인 for문,
// 그리고 조건에 대한 반복인 while문이 있습니다.

// 반복의 대상은 1부터 10까지의 정수로 해 보겠습니다.
let waitOrders = 1...3
for order in waitOrders {
    print(String(order))
}

// 바로 for in 문에 숫자 범위데이터를 적을 수도 있습니다.
for order in 4...6 {
    print(String(order))
}

// 배열은 당연히 되고요
for word in strArrayWithType {
//    루프상수는 let으로 지정되는 상수와 같으므로 값을 바꿀 수 없습니다.
//    word = "cannot assign!" // 에러!
}

// 딕셔너리도 됩니다. 그런데, 나오는 순서는 어떻게 될지 몰라요.
for food in foodDic {
    print(food.key)
}

// 단순한 횟수 반복이면 루프상수는 언더바로 생략 가능합니다.
for _ in foodDic {
    // 반복중
}

var aNumberForWhile = 1
// while문은 조건이 맞는 상황에서만 반복됩니다
while aNumberForWhile < 10 {
    aNumberForWhile = aNumberForWhile + 3
    print("while 실행됨, \(aNumberForWhile) < 10")
}

var aNumberForRepeat = 1
// repeat문은 조건을 뒤에 적습니다. 먼저 블럭을 실행하고 나서 반복을 할것인지 while 조건을 검사합니다.
repeat {
    aNumberForRepeat = aNumberForRepeat + 3
    print("repeat 실행됨, \(aNumberForRepeat) < 10")
}
while aNumberForRepeat < 10

aNumberForWhile = 11
// 10보다 작은 수를 넣지 않았으니 아래 while문은 아예 동작을 하지 않겠지요?
while aNumberForWhile < 10 {
    aNumberForWhile = aNumberForWhile + 3
    print("11을 넣은 뒤 while 실행될까?")
}
print("11을 넣은 뒤 aNumberForWhile값 = \(aNumberForWhile)")

aNumberForRepeat = 11
// repeat-while 문이라면 어떨까요? 차이를 알아봅시다.
repeat {
    aNumberForRepeat = aNumberForRepeat + 3
    print("11을 넣은 뒤 repeat 실행될까?")
}
while aNumberForRepeat < 10
print("11을 넣은 뒤 aNumberForRepeat값 = \(aNumberForRepeat)")





print("\n\n#lesson 5 - Branch statement \n")

var coffeeDic = ["아메리카노": 2000, "마끼아또": 3000, "라떼": 2500]

// 기본적인 조건문은 타 언어와 크게 다르지 않습니다.
if coffeeDic["아메리카노"] == 1000 {
    print("아메리카노는 1000원이 맞습니다")
} else if coffeeDic["아메리카노"] == 2000 {
    print("아메리카노는 2000원이 맞습니다")
} else {
    print("아메리카노의 가격은 1000원도 2000원도 아닙니다")
}

// 함수 내에서는 guard를 사용하여 else문만 체크할 수 있다는 차이는 있습니다.
func checkAmericanoPrice() {
    guard coffeeDic["아메리카노"] == 1000 else {
        print("아메리카노는 1000원이 아닙니다")
        return
    }
    print("아메리카노는 1000원인가 봅니다")
}
checkAmericanoPrice()


// #available


// swift의 switch문은 타 언어와 크게 다르지는 않으나, break를 쓰지 않는다는 점에서 차이가 있습니다.
// 만일 아래 케이스의 문장과 함께 실행되길 원한다면, fallthrough라고 적어주면 됩니다.
coffeeDic["아메리카노"] = 3000
switch coffeeDic["아메리카노"] {
case 1000:
    print("아메리카노가 1000원인 케이스")
case 2000:
    print("아메리카노가 2000원인 케이스")
case 3000:
    fallthrough
default:
    print("아메리카노가 1000원이나 2000원 외의 다른 가격인 케이스")
}




// enum 활용 switch

// 함수

// 객체로서의 함수

// 클로저

// 구조체

// 클래스, 프로퍼티, 메소드

// 타입 메소드

// 옵셔널 체인















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
var microwaveOven: Oven = MiniOven(type: "전자렌지")
microwaveOven.turnOn()






print("\n\n#lesson - Extension")

// 익스텐션은 class를 여러개의 구현으로 나누어 적는 기법입니다.
// swift에는 존재하지 않는 file dependency를 보강하기 위한 부분으로 보입니다.
class BrunchCafe {
    func dripCoffee(){
        print("커피 드립하는 중")
    }
}

// 클래스와 동일한 이름으로 만듭니다.
extension BrunchCafe {
    func cookBrunch(){
        print("브런치 요리하는 중")
    }
}

// 나누어 구현했지만 하나의 객체로 사용할 수 있습니다.
var myCafe = BrunchCafe()
myCafe.dripCoffee()
myCafe.cookBrunch()

// 저장 프로퍼티는 추가할 수 없습니다. 계산 프로퍼티만 가능합니다.
extension BrunchCafe {
    //    var coffeePowder: String! // 에러!
    var iceTea: String! {
        return "아이스티"
    }
}
print(myCafe.iceTea);

// initializer는 convinence 인 경우에만 추가가 가능합니다.
extension BrunchCafe {
    //    init(){} // 에러!
    convenience init(type: String){
        self.init()
    }
}





print("\n\n#lesson - Extension with Protocol")

// initializer가 없다는 전제 하에, 익스텐션이 프로토콜을 확장구현할 수 있습니다.
protocol Pasta {
    //    func boilWater(){ // 에러! 프로토콜에서는 함수의 내용을 구현할 수 없습니다.
    //        print("boiling")
    //    }
}

// 하지만 익스텐션에서는 함수의 구현이 가능합니다.
extension Pasta {
    func boilWater(){
        print("물 끓이는 중")
    }
}

// 구조체로 가져올 수 있겠지요.
struct Breakfast: Pasta{}
var myMeal = Breakfast()
myMeal.boilWater()

// 하나 더 만들어 봅니다.
protocol Pizza {}
extension Pizza {
    func chopVegetables(){
        print("야채 써는 중")
    }
}

// 클래스를 구현할 때 다중 상속의 효과를 낼 수 있습니다.
class ItalianBrunch: Pasta, Pizza {
    func boilWater(){ // 프로토콜 익스텐션에서 먼저 구현했던 함수를 재정의할 수도 있습니다.
        print("다시 물 끓이는 중")
    }
}

// 실행해 봅시다.
var myLunch = ItalianBrunch()
myLunch.chopVegetables()
myLunch.boilWater()

// 다른 클래스 간 동일한 코드의 중복을 방지할 수 있습니다.
class ItalianDinner: Pasta, Pizza {}
var myDinner = ItalianDinner()
myDinner.chopVegetables()
myDinner.boilWater()








print("\n\n#lesson - Error handling")

let logPath = "./" // 잘못된 파일명을 입력
var str = "savedata"

//throws로 핸들링하도록 만들어진 함수는 꼭 do try catch 를 붙여서 에러핸들링을 해야 한다.
do {
    try str.write(toFile: logPath, atomically: true, encoding: String.Encoding.utf8)
} catch {
    print("에러 발생")
}

// 에러를 가져오려면 다음과 같이 합니다.
do {
    try str.write(toFile: logPath, atomically: true, encoding: String.Encoding.utf8)
} catch let error{
    print("에러 발생 -> ", error.localizedDescription)
}

// try의 위치에 유의하기 바랍니다. 값을 반환하는 함수의 경우 대입되기 이전에 검사해 주어야 합니다.
do{
    let readWrongTxt = try String(contentsOfFile: logPath)
    print(readWrongTxt)
} catch let error{
    print("에러 발생 -> ", error.localizedDescription)
}

// 에러 발생시 nil이 반환되도록 강제로 optional type 캐스팅할 수 있습니다.
let readWrongTxt = try? String(contentsOfFile: logPath)
print(type(of: readWrongTxt))





print("\n\n#lesson - Custom Error")

// 에러는 enum, struct, class로 커스텀이 가능합니다.
// enum으로 정의해 봅니다.
enum CustomErrorEnum: Error{
    case bug
    case fatal
    case critical
}

// struct로 정의해 봅니다.
struct CustomErrorStruct: Error{
    var msg: String
}

// class로 정의해 봅니다.
class CustomErrorClass: Error{
}

// 각기 다른 커스텀 에러들을 분기하는 방법은 다음과 같습니다.
do{
    //    let error = CustomErrorEnum.critical
    let error = CustomErrorStruct(msg: "에러 구조체")
    //    let error = CustomErrorClass()
    throw error // 에러 발생
} catch let error where error is CustomErrorEnum {
    print("CustomErrorEnum catch")
} catch let error where error is CustomErrorStruct {
    print("CustomErrorStruct catch")
} catch let error where error is CustomErrorClass {
    print("CustomErrorClass catch")
}

// 커스텀 에러를 내포한 함수를 작성해 보겠습니다.
func dangerousFunc(num: Int) throws {
    guard num > 0 else{
        throw CustomErrorEnum.bug
    }
    print("0보다 큼")
}

// do try catch로 실행해 봅니다.
do {
    try dangerousFunc(num: 0)
} catch let error where error is CustomErrorEnum {
    print("0보다 크지 않아서 에러")
}

// 리턴값이 필요한 함수의 경우, Optional type을 이용하면 에러시 nil을 받을 수 있습니다.
func dangerousReturn(num: Int) throws -> String {
    guard num > 0 else{
        throw CustomErrorEnum.bug
    }
    return "0 보다 크다"
}

// do try catch로 실행해 봅니다.
var isBiggerThanZero = try? dangerousReturn(num: 0)
isBiggerThanZero = try? dangerousReturn(num: 1)





print("\n\n#lesson - Error with closure")



