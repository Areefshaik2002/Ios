import UIKit

///Macros
//#Line - returns the line number
//print("This is line number: \(#line)")
//print("This is line number: \(#line)")
//#file - returns the file address
//print("File: \(#file)")

//#lineD - returns a more concise identifier for the file
//print("File ID: \(#fileID)")

//print("Column number: \(#column)")

#if os(iOS)
//print("Running on iOS")
#elseif os(macOS)
print("Running on macOS")
#else
print("Running on another platform")
#endif

struct Person {
    let name: String
    let age: Int
}
let person = Person(name: "Areef", age: 22)
//dump(person)

var add = {(n1:Int, n2:Int) -> Int in
    var n3 = n1 + n2
    return n3
}
var addition = add(10, 20)

var string = """
vdfukygfliqeu
weghvkudsbfkhcffhjask,
fja,bhdjskjewa
hjwlabkns..lkzm
"""
//print(string)

//example
/*vgkwudsjas.knc. qasjkffFNEENCJKASBCILEJNF CJKSCBAUIEKFJSC NJKAHIFNEWLI.BAJDK.BCILU.BCWIUKJ.V*/

//print("hii");print("hello")


let val = Int64.max

func sumOfEvenNumbers(in array: [Int]) -> Int {
    var sum = 0
    for i in array{
        if i % 2 == 0{
            sum += i
        }
    }
    return sum
}
let arr1 =  [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
sumOfEvenNumbers(in: arr1)

func reverseString(_ str: String) -> String {
//    return String(str.reversed())
    var rev = ""
    for i in str{
        rev = "\(i)"+rev
    }
    return rev
}
reverseString("gold")

//func fibonacciSequence(upTo n: Int) -> [Int] {
//    if n == 1 { return [1] }
//    if n == 2 { return [0, 1] }
//    
//    var sequence = [0, 1]
//    for i in 2..<n {
//        let nextNumber = sequence[i - 1] + sequence[i - 2]
//        sequence.append(nextNumber)
//    }
//    return sequence
//}
//
//func series(_ count: Int) {
//    let fullSequence = fibonacciSequence(upTo: count)
//    
//    for i in 0..<count {
//        let seq = fullSequence.prefix(i + 1)
////        print(seq, terminator: " ")
//    }
//}

// Example Usage
//series(10)

func fibonacciSequence(upTo n: Int) -> [Int] {
    if n == 1 { return [1] }
    if n == 2 { return [0, 1] }
    
    var sequence = [0, 1]
    for i in 2..<n {
        let nextNumber = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextNumber)
    }
    return sequence
}

func series(_ count: Int) {
    let fullSequence = fibonacciSequence(upTo: count)
//    print(fullSequence)
}

// Example Usage
series(10)

func fibo(_ n: Int) -> [Int]{
    var a = 0
    var b = 1
    var array = [a,b]
    for i in 0..<n{
        var next = a + b
        array.append(next)
        a = b
        b = next
    }
    return array
}
fibo(5)

func isPalindrome(_ str: String) -> Bool {
    let reversed = String(str.reversed())
    if reversed == str{
        return true
    }
    return false
}
isPalindrome("mom")
