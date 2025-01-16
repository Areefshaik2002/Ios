import UIKit

//Generics

//Generic method creation
func swapTwoValues<Element>(a: inout Element, b: inout Element) -> (a: Element, b:Element){
    var temp = a
    a = b
    b = temp
    return (a, b)
}
var a = 20
var b = 4
swapTwoValues(a: &a, b: &b)

//Find index of a value in an array
func findIndex<T: Equatable>(of valueToFind:T, in array:[T]) -> Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}
let arrayofGenerics = [1,2,3,4,5,6,7,8]
findIndex(of: 8, in: arrayofGenerics)

//Associated Types
protocol Container{
    associatedtype Element
    mutating func append(_ item: Element)
    var count:Int{get}
    subscript(i:Int) -> Element{get}
}

struct String<Element>:Container{
    
    typealias Item = Int
    
    var items:[Element] = []
    mutating func push(_ item:Element){
        items.append(item)
    }
    mutating func pop()->Element{
        return items.removeLast()
    }
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

//Extending an existing type to specify an asscoiated type
extension Array:Container{}

protocol Storage{
    associatedtype Element:Equatable
    mutating func append(_ item: Element)
    var count:Int{get}
    subscript(i:Int) -> Element{get}
}
protocol SuffixableContainer: Storage {
    associatedtype Suffix: SuffixableContainer where Suffix.Element == Element
    func suffix(_ size: Int) -> Suffix
}

