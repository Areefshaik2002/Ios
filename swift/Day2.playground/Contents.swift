import UIKit
//
////Tuples
//var details = (404, "error response",5.4,true)
//print(details.3)
//print(details.2)
//print(details.1)
//print(details.0)
////Optionals
//var a = 2
//var b = Int(a)
//print(b)
//
//let possibleNumber = "123"
//let convertedNumber = Int(possibleNumber)
//if convertedNumber != nil {
//    print("convertedNumber contains some integer value.")
//}
//
////Operators
////Terenary operator
//let x = 10
//let y = 20
//let z = (x > y ? x : y)
////print("the largest value is \(x > y ? x : y)")
//print(String(z)+" is the largest value")
//
////Nil coalescing operator
//var name : String? =  nil
//print("welcome back \(name ?? "sir/mam")")
//var customerName : String? = "Areef"
//print("welcome back \(customerName ?? "sir/mam")")
//
//var m = 171
//var n = 3
//var o = m & n
//print(o)
// m = 171
// n = 3
// o = m | n
//print(o)
//
////Control flow
////for-in
//for i in 0..<3{
//    print("the value is \(i)")
//}
//
//var count = 0
//for j in 1...3{
//    count+=1
//    print(count)
//}
//
////while loop
//var mycount = 0
//while mycount < 10{
//    mycount += 1
////    print(mycount)
//}
//print(mycount)
//repeat...while loop
//var i = 10
//repeat{
//    i -= 1
//    print(i)
//}while i > 0
//
////breaking a loop -- break
//var k = 20
//for i in 1...100{
//    k += k
//    if k>100{
//        break
//    }
//    print("k = \(k)")
//        
//}
//
// //continue
//var i = 0
//while i < 20{
//    i += 1
//    if i % 2 == 0{
//        continue
//    }
//    print("i = \(i)")
//}
//
//if - else if
//var age = 27
//if age >= 18 && age < 25{
//    print("you are eligible to vote and for driving license")
//}else if age > 25 {
//    print("you should start thinking about your savings")
//}else{
//    print("you need to be older for this")
//}
//
////the gaurd statement
//func isEligible(age:Int){
//    guard age >= 18 else{
//        print("You are not eligible for this")
//        return
//    }
//    print("You can proceed to the next steps")
//}
//isEligible(age: 16)
//
////switch-statement
//var i = 22
//switch i % 2{
//case 0:
//    print("Even number")
//case 1:
//    print("Odd number")
//default:
//    print("hmm")
//}
//
//var i = 0
//while i < 10{
//    i += 1
//    switch i % 2{
//    case 0:
//        print("Even")
//    case 1:
//        print("Odd")
//    default:
//        print("aha")
//    }
//}
//
//

////Combining cases
//var ch = "c"
//switch ch{
//case "a", "e", "i", "o" , "u":
//    print("Vowel")
//case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
//    print("consonant")
//default:
//    print("Enter a valid letter")
//}

////Range matching switch statements
//let rollNo = 8
//switch rollNo{
//case 1...5:
//    print("first class")
//case 6...10:
//    print("second class")
//default:
//    print("invalid rollNo")
//}

//// Using the where statement
//let temperature = 22
//switch temperature{
//case 0...24 where temperature % 2 == 0:
//    print("cold and even")
//case 25...32 where temperature % 2 == 0:
//    print("warm and even")
//case 33... where temperature % 2 == 0:
//    print("Hot and even")
//default:
//    print("invalid and odd temperature")
//}
////Fall through in switch statements
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

////Functions
//func addition(n1:Double, n2:Double) -> Double{
//    return n1 + n2
//}
//print(addition(n1: 10, n2: 10))

//func buildMessageFor(name: String, count: Int) -> String {
//       "\(name), you are customer number \(count)"
//}
//var message = buildMessageFor(name: "Areef", count: 38)
//print(message)

//multiple functions in a single function
func conversion(_ length:Float) -> (yards:Float,centimeters:Float,meters:Float){
    let yards = length * 2
    let centimeters = length * 3
    let meters = length * 4
    return (yards,centimeters,meters)
}
let sizeConverter = conversion(20)
print(sizeConverter.centimeters)

