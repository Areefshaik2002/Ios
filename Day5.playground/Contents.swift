import UIKit

//var greeting = "Hello, playground"

//var i = 1
//while i < 20
//{
//    i += 1
//    if (i % 2) != 0 {
//        continue }
//    print("i = \(i)")
//}

//let temperature = 10
//switch (temperature)
//{
//      case 0...49 where temperature % 2 == 0:
//        print("Cold and even")
//        fallthrough
//      case 50...79 where temperature % 2 == 0:
//        print("Warm and even")
//        fallthrough
//      case 80...110 where temperature % 2 == 0:
//        print("Hot and even")
//        fallthrough
//      default:
//        print("Temperature out of range or odd")
//}

//func multiply( n1:Int,with n2: Int) -> Int{
//    n1 * n2
//}
//print(multiply(n1: 10, with: 30))

//func buildMessageFor(_ name: String = "Areef", count: Int ) -> String
//{
//    return ("\(name), you are customer number \(count)")
//}
//buildMessageFor(count: 5)


//func studyYear( year:Int) -> (first: Int, second: Int, third: Int){
//    let firstYear = year * 1
//    let secondYear = year * 2
//    let thirdYear = year * 3
//    return (firstYear,secondYear,thirdYear)
//}
//let obj = studyYear(year: 1)
//obj.first
//obj.second
//obj.third

//func display( num:Int...) {
//    for i in num{
//        print(i)
//    }
//}
//display(num: 1,2,3,4,5)

func perimeter(length:Int,width:Int) -> Int{
    var length = length
    var width  = width
    
    return 2 * (length + width)
}

//var peri = perimeter(length: 10, width: 20)
//perimeter(length: 10, width: 20)

//var myValue = 10
//func doubleValue (_ value: Int) -> Int {
//    var value = value
//    value += value
//    return(value)
//}
//print("Before function call myValue = \(myValue)")
//print("doubleValue call returns \(doubleValue(myValue))")
//print("After function call myValue = \(myValue)")
//
//func add(a: Int, b:Int) -> Int{
//    return a + b
//}
//func multiply(a: Int, b:Int) -> Int{
//    return a * b
//}
//
//func calculate(a: Int,b: Int, using operation: ( Int, Int ) -> Int) -> Int{
//    return operation(a, b)
//}
//let result = calculate(a: 2, b: 4, using: multiply)
//
//let multiply = {(a:Int,b:Int) -> Int in//closure
//    return a * b
//}
//print(multiply(a: 10, b: 20))

//func functionA() -> () -> Int{
//    var counter = 0
//    func functionB() -> Int{
//        return counter + 10
//    }
//    return functionB
//}
//let myclosure = functionA()
//let solution = myclosure
//print(solution)

//class Study{
//    var tool1 : String = ""
//    var tool2 : String = ""
//
//    init(tool1: String, tool2: String) {
//        self.tool1 = tool1
//        self.tool2 = tool2
//    }
//
//    var workingTool1: String{
//        get{
//            return tool1
//        }
//        set(tool1){
//            print("using \(tool1)")
//        }
//    }
//    var workingTool2: String{
//        get{
//            return tool2
//        }
//        set(tool2){
//            print("using \(tool2)")
//        }
//    }
//
//    func studyUsing(tool1: String, tool2: String){
//        print("tool1: \(tool1)")
//        print("tool2: \(tool2)")
//        let sentence = "using \(tool1) and \(tool2)"
//        print(sentence)
//    }
//}
//extension Study{
//    func details(){
//        print("take care of your tools")
//    }
//}
//
//class Practice: Study{
//    var tool3 : String = ""
//
//    init(tool1: String, tool2: String, tool3: String) {
//        self.tool3 = tool3
//        super.init(tool1: tool1, tool2: tool2)
//    }
//
//    func newTool(Tool3:String){
//        print("tool3: \(Tool3)")
//    }
//    override func studyUsing(tool1: String, tool2: String)  {
//        print("tool1: \(tool1)")
//        print("tool2: \(tool2)")
//        super.studyUsing(tool1: tool1, tool2: tool2)
//        print("tool3: \(tool3)")
//    }
//}
//
//var toolKit1 = Study(tool1: "Book", tool2: "website")
//toolKit1.tool1
//toolKit1.tool2
//print(toolKit1.details())
//print(toolKit1.studyUsing(tool1: "book", tool2: "app"))
//var toolKit2 = Practice(tool1: "Book", tool2: "website", tool3: "laptop")
//toolKit2.newTool(Tool3: "laptop")
//toolKit2.studyUsing(tool1: "Book", tool2: "Pen")

//var mixed : [Any] = [1,0.1,"DSA",true]
//print(mixed)
//for i in mixed{
//    print(i)
//}



