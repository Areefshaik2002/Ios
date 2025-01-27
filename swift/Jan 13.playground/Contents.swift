import UIKit
//
//var greeting = "Hello, playground"
//
//func reverseString(str:String) -> String{
//    return String(str.reversed())
//}
//reverseString(str: "Hello")
//
//func reverseString(str: String) -> String{
//    var reversed = ""
//    for i in str{
//        reversed = "\(i)"+reversed
//    }
//    return reversed
//}
//reverseString(str: "Areef")
//
//func isPalindrome(str:String) -> Bool{
//    let reversed = String(str.reversed())
//    return str == reversed
//}
//if isPalindrome(str: "woww"){
//    print("palindrome")
//}else{
//    print("not a palindrome")
//}
//
//func occurences(str:String, char: Character) -> Int{
//    return str.filter{$0 == char}.count
//}
//occurences(str: "MADAM", char: "M")
//
//
//func vowelConsonants(str:String) -> (vowels:Int,consonants:Int){
//    let vowelSet = "aeiouAEIOU"
//    let vowels = str.filter{vowelSet.contains($0)}.count
//    let consonant = str.filter{ $0.isLetter && !vowelSet.contains($0)}.count
//    return (vowels , consonant)
//}
//vowelConsonants(str: "alphabet")
//
//func matchingElements(arr:[Int], match:Int) -> [Int]{
//    return arr.filter{ $0 == match }
//}
//matchingElements(arr: Array(arrayLiteral: 1,2,3,4,5,1,2,3,1) , match: 1)
//
//func bubbleSort(_ arr: inout [Int]) {
//    for i in 0..<arr.count {
//        for j in 0..<arr.count - i - 1 {
//            if arr[j] > arr[j + 1] {
//                arr.swapAt(j, j + 1)
//            }
//        }
//    }
//}
//
//func bubbleSort(arr : inout [Int]){
//    for i in 0..<arr.count{
//        for j in 0..<arr.count - i - 1{
//            if arr[j] > arr[j + 1]{
//                arr.swapAt(j, j + 1)
//            }
//        }
//    }
//}
//var array = [8,7,6,54,33,2,111]
//bubbleSort(arr: &array)
//
//func insertionSort(arr : inout [Int]){
//    for i in 1..<arr.count{
//        let key = arr[i]
//        var j = i - 1
//        while j>=0 && arr[j] > key{
//            arr[j+1] = arr[j]
//            j-=1
//        }
//        arr[j+1] = key
//    }
//}
//var arr = [32,1,23,55,33,86]
//insertionSort(arr: &arr)
//
//var arr  = [1,2,3,4,54,6]
//var reversed = arr.reversed()
//print(Array(reversed))
//
//func reverseArray(arr:[Int]) -> [Int]{
//    return arr.reversed()
//}
//let arrayRev = [1,2,3,4,5,6,7]
//reverseArray(arr: arrayRev)
//
//var a = 10
//var b = 20
//print(a, b)
//a = a + b
//b = a - b
//a = a - b
//print(a, b)
//
//func factorial(_ n:Int) -> Int{
//    return n <= 1 ? 1 : n * factorial(n - 1)
//}
//factorial(5)
//
//func factorial(_ n:Int) -> Int{
//    var fact = 1
//    for i in 1...n{
//        fact = fact * i
//    }
//    return fact
//}
//factorial(6)
//
//func fibonacci(_ n:Int) -> Int{
//    if n <= 1 {return n}
//    return fibonacci(n - 1) + fibonacci(n - 2)
//}
//print(fibonacci(10))
//
//func fibonacci(_ n:Int) -> Int{
//    if n <= 1{return n}
//    
//    var a = 0
//    var b = 1
//    for i in 2...n{
//        let c = a + b
//        a = b
//        b = c
//    }
//    return b
//}
//fibonacci(10)
//
//var arr = [22,12,33,43,56,77,21]
//func secondLargest(_ arr : [Int]) -> Int?{
//    var sortedArray = Array(arr).sorted()
////    return sortedArray.count >= 2 ? sortedArray[sortedArray.count - 2] : nil
//    return sortedArray[sortedArray.count - 2]
//}
//secondLargest(arr)
//
//func removeOccurences(_ str:String, _ char: Character) -> String{
//    return str.filter{$0 != char}
//}
//removeOccurences("Areef", "e")
//
//func isPrime(_ number: Int) -> Bool{
//    if number <= 1{return false}
//    for i in 2..<number{
//        if number % i == 0{
//            return false
//        }
//    }
//    return true
//}
//if isPrime(20){
//    print("prime")
//}else{
//    print("not prime")
//}
//var sum = 0
//for i in arr{
//    sum += i
//}
//print(sum)

//
//import Foundation
//
//print("Enter a number, n1: ")
//if let input1 = readLine() , let num1 = Int(input1){
//    print("Enter a number, n2 : ")
//    if let input2 = readLine(), let num2 = Int(input2){
//        let sum = num1 + num2
//        print("the sum of n1 and n2 is \(sum)")
//    }else{
//        print("enter a valid n2")
//    }
//}else{
//    print("enter a valid n1")
//}


    



