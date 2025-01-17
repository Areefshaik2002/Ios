import UIKit

///Arrays
//creating an empty array
var arr:[Int] = []
//adding default values to an array
var defaultArray = Array(repeating: 0, count: 5)
defaultArray[0] = 1
defaultArray[1] = 2
defaultArray[2] = 3
defaultArray[3] = 4
defaultArray[4] = 5
//print(defaultArray)
//creating an array by adding 2 arrays
var anotherDefaultArray = Array(repeating: 0, count: 5)
var finalArray = defaultArray + anotherDefaultArray
//print(finalArray)
//array with an array literal
var shoppingList:[String] = ["Eggs","Milk","Broom"]
//short-hand form
var list = ["eggs","milk","broom"]
//count() method - returns the number of elements exist in the array
list.count
//isEmpty() method - returns true if array contains any elements else returns false
list.isEmpty
//append() - adds a new item to the end of an array
list.append("mop")
//adding elements in an array using addition assignment
list += ["jeans","watch"]
//retrive a value of an array using subscript-[]
list[2]
//changing value using subscript
list[2] = "handbag"
list
//changing values for a range
list[1...3] = ["ring","Toycar","Toycar"]
list
//inserting a value using insert(at:)
list.insert("bycycle", at: 2)
//removeing a value using remove(at:)
list.remove(at: list.count-1)
list
//removeLast
list.removeLast()
list
//iterating over an array
for i in list{
//    print(i)
}
//enumerated()
for (index, value) in list.enumerated(){
//    print("item\(index+1):\(value)")
}





///Sets
//creating an empty set
var exampleSet :Set<Character> = []
var exampleSet2 = Set<Character>()
//print("letters is of type Set<Character> with \(exampleSet2.count) items.")
exampleSet2.insert("a")
//print(exampleSet2)
exampleSet2 = []
//print(exampleSet2)
//Creating a Set with an Array Literal
var sampleSet :Set<String> = ["Areef","sai","kumar"]
var sampleSet2 : Set = [1,2,3,4,5,6,7]
var sampleSet3: Set = [1,2,3,4,5,6,7,7]
//print(sampleSet2)
//print(sampleSet3)//unordered and removed duplicates since its a set
//print(list)//orderd and allowed duplicates since its an array
//Count()
sampleSet.count
//isEmpty()
sampleSet.isEmpty
//insert(at:)
sampleSet.insert("Altaf")
sampleSet
//remove()
sampleSet.remove("Altaf")
//contains()
sampleSet.contains("Areef")
//Iterating over a set
for i in sampleSet.sorted(){
//    print("\(i)")
}
//here in above iteration i used sorted() to make set sort and return the same order
///Set operations
//intersection
var a:Set = [1,2,3,4,5,6]
var b:Set = [1,2,3,4,5,6,7,8,9,10]
//print(a.intersection(b).sorted())
//print(a.symmetricDifference(b).sorted())
//print(b.symmetricDifference(a).sorted())
//print(a.union(b).sorted())
//print(a.subtracting(b).sorted())
//print(b.subtracting(a).sorted())
var c:Set = [1,2]
var d:Set = [11,12]
a == b
a.isSubset(of: b)
a.isSuperset(of: b)
b.isSuperset(of: a)
c.isSubset(of: a)
a.isSubset(of: c)
c.isSubset(of: a)
a.isStrictSubset(of: c)
a.isDisjoint(with: b)
c.isDisjoint(with: b)
c.isDisjoint(with: d)




///Dictionaries
//creating an empty dictionary
var nameOfInteger:[Int:String] = [:]
nameOfInteger[1] = "One"
nameOfInteger[2] = "two"
nameOfInteger[3] = "three"
nameOfInteger

//creating array using dictionary literal
var dictinary1 = [001:"Areef",002:"Sai",003:"Kumar"]
dictinary1.count //3
dictinary1.isEmpty //false
//adding elements
dictinary1[004] = "sharfuddin"
//changing elements
dictinary1[004] = "saif"//changes the value associated with 004 key
dictinary1
//updataing a value in dictionary
dictinary1.updateValue("sharfuddin", forKey: 005)
dictinary1
dictinary1.updateValue("altaf", forKey: 5)
dictinary1
if let oldValue = dictinary1.updateValue("Altaf", forKey: 005){
    //print(oldValue)//Prints the old value of "altaf" instead of "Altaf" so that we can check if its updated or not
}
dictinary1[5]//"Altaf"
//removing a pair in dictionary
dictinary1[5] = nil
dictinary1 //"Altaf" is removed
dictinary1[006] = "jafar"
dictinary1
if let removedValue = dictinary1.removeValue(forKey: 006){
    //print(removedValue)//returns value of 006 so that we can check if the value is removed or not
}
dictinary1
//Iterating over a dictionary
for (key, value) in dictinary1{
//    print("\(key):\(value)")
}
for i in dictinary1.keys{
//    print(i)
}
for j in dictinary1.values{
//    print(j)
}
let rollNumbers = [Int](dictinary1.keys)
let EmployeeNames = [String](dictinary1.values)
