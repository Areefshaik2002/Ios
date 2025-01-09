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

var arr = [2,1,3,4,5,7,9,11,6]
var sum = 0
for i in 0..<arr.count{
    sum += arr[i]
}
print(sum)






