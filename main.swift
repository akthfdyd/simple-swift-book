import Foundation


print("\n\n#lesson 1 - Constant, Variable \n")

// Swift는 문장의 끝에 세미콜론을 쓰지 않습니다

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

// Optional 타입 선언시 자동으로 normal 타입으로의 형변환은 !를 이용합니다
var optAutoChange : String! = nil
optAutoChange = "optional type"
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




print("\n\n#lesson 3 - Dictionary \n")

// Dictionary는 key:value 형태의 Collection 입니다
var foodDic = ["김밥" : 2000, "라면" : 3000, "떡볶이" : 2500]
print(foodDic)

// Dictionary의 요소는 Optional type이기 때문에 !를 붙여야 합니다
print(foodDic["라면"]!)

// 역시 만들때부터 타입을 지정할 수 있습니다.
var emptyDicWithType : [String : String]
var emptyDicFromObject : Dictionary<String, String>

// 딕셔너리의 크기는 이렇게 구합니다
print(foodDic.count)

// 딕셔너리는 
