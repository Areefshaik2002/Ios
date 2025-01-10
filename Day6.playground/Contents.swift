import UIKit

var greeting = "Hello, playground"

///largest and smallest value in an array
//var arr = [2,1,3,4,5,7,9,11,6]
//var sortedArray = arr.sorted()
//print(sortedArray)
//print(sortedArray.first!)
//print(sortedArray.last!)
//let smallest = sortedArray[0]
//let largest = sortedArray[sortedArray.count - 1]
//print("smallest : \(smallest)")
//print("largest : \(largest)")
//let maxvalue = arr.max()
//let minvalue = arr.min()
//print("maximum : \(maxvalue ?? 0)\nminimum: \(minvalue ?? 0)")

///reverse an array
//var arr = [2,1,3,4,5,7,9,11,6]
//var reversedArray = arr.reversed()
//print(Array(reversedArray))

///remove duplicates from an array
//var arr = [2,1,3,4,5,7,9,11,6,2,1,2,3,7]
//let noDuplicates = Array(Set(arr))
//print(noDuplicates)

///finding the index of an element
//var arr = [2,1,3,4,5,7,9,11,6]
//let index = arr.firstIndex(of: 3)!
//print(index)

///sum of values in an array
//var arr = [2,1,3,4,5,7,9,11,6]
//var sum = 0
//for i in 0..<arr.count{
//    sum += arr[i]
//}
//print(sum)

///Vowel and consonant count
//let str = "Hello, India"
//let vowels = "aeiouAEIOU"
//let vowelCount = str.filter{
//    vowels.contains($0)}.count
//let consonantCount = str.filter{
//    $0.isLetter && !vowels.contains($0)}.count
//print("vowelCount : \(vowelCount)\nconsonantCount : \(consonantCount)")


//struct Point{
//    var x: Double
//    var y: Double
//}
//
//let point = Point(x: 10, y: 10)
//print(point.self)

///Rotating an array
//let array = [1,2,3,4,5,6,7]
//let k = 2
//let rotatedArray = Array(array[k...]+array[..<k])
//print(rotatedArray)

///palindrome string
//let str = "madam"
//let isPalindrome = str == String(str.reversed())
//print(isPalindrome)

//func isPalindrome(str:String) ->Bool{
//    let result =  str == String(str.reversed())
//    return result
//}
//if isPalindrome(str: "madam"){
//    print("given string is a palindrome")
//}else{
//    print("given string is not a palindrome")
//}

///common elements between 2 arrays
//let array1 = [1,2,3,4]
//let array2 = [3,4,5,6]
//let commonElements = array1.filter(array2.contains)
//print(commonElements)

///count the occurences of characters in string
//func countCharacters(in string:String) -> [Character:Int]{
//    var counts:[Character:Int] = [:]
//    for char in string{
//        counts[char, default: 0] += 1
//    }
//    return counts
//}
//
//let result = countCharacters(in: "madam")
//print(result)

//let scores = ["vijay": 99, "virat" : 84, "vishal": 77]
//if let (name, _) = scores.max(by: {$0.value < $1.value}){
//    print("Highest score: \(name)")
//}








