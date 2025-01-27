import UIKit

let num = 90
let person = "He weighs "
let result = person + String(num)
print(result)

//arrays
var nums = [23,11,22,34,221,55,87]
print(nums)
print(nums.count)
var final = nums.sorted()
print(final)
var arr = ["development","testing","sales","marketing"]
print(arr)
arr.append("Human resources")
print(arr)
print(arr.count)
print(arr.isEmpty)
print(arr.self)

//type conversion with string concatenation
var number:Int=21
var word:String = "hello "
var sentence:String = word + String(number)
print(sentence)
//type conversion
let n1 = 90.0
let n2 = 10
let n3 = n1 + Double(n2)
print(n3)
//if-else
let age = 19
if age > 18{
    print("eligible to vote")
}else{
    print("not eligible to vote")
}
//for loop
var players = ["jaiswal","Rohit","shubman","virat","nkr","hardik"]
for player in players{
    print(player)
}
//even or odd
for i in 1...10 {
    if i%2==0{
        print("even")
    }else{
        print("odd")
    }
}
//set
var ages = [18,12,13,1,4,56,28,9,45,41,18,12,13,1,4]
print(ages)
var agesSet:Set<Int> = []
agesSet = Set(ages)
print(agesSet)

//Dictionary
var employee = [
    "Ravi":"developer",
    "vijay":"tester",
    "salman":"Human resources",
    "kiran":"marketing",
    "rajesh":"sales"
]
print(employee)
var last = employee.count
print(last)

//functions

