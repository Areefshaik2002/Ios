import UIKit

///Enumerations
//enum CompassPoint:String , CaseIterable{
//    case north
//    case south
//    case west
//    case east
//}
//let direction = CompassPoint.north.rawValue
//var directionToHead = CompassPoint.east
//directionToHead  = .north
//switch directionToHead {
//case .east:
//    print("we must head to east")
//case .north:
//    print("north seems more safer")
//case .south:
//    print("south has a see, we might find civilization there")
//case .west:
//    print("lets head to the holy qaba in west")
//default:
//   print("i dont want to go anywhere")
//}
//let iterate = CompassPoint.allCases
//for i in iterate{
//    var val = i
//    print(val)
//}

//enum Barcode{
//    case upc(Int, Int, Int, Int)
//    case qr(String)
//}
//var productBarcode = Barcode.upc(8, 6734, 7821, 3)
//productBarcode = .qr("Areefshaik")
//switch productBarcode{
//case .upc(let ProductId, let productNumber, let productValue, let productVariant):
//    print("UPC: \(ProductId),\(productNumber),\(productValue),\(productVariant)")
//case .qr(let qrString):
//    print("QR: \(qrString)")
//}

//enum Planets:Int{
//    case mercury, venus, earth, mars, jupiter=5, saturn, uranus, neptune
//}
//let earthsOrder = Planets.mars.rawValue
//let saturnOrder = Planets.saturn.rawValue
//let possiblePlanet = Planets(rawValue: 11)
//print(possiblePlanet ?? "error")

// enum ArithematicExpression{
//    case number(Int)
//    indirect case addition(ArithematicExpression, ArithematicExpression )
//    indirect case multiplication(ArithematicExpression, ArithematicExpression)
//}
//let five = ArithematicExpression.number(5)
//let four = ArithematicExpression.number(4)
//let two = ArithematicExpression.number(2)
//let sum = ArithematicExpression.addition(five, four)
//let product = ArithematicExpression.multiplication(sum, two)
//
//func evaluate(_ expression: ArithematicExpression) -> Int {
//    switch expression {
//    case let .number(value):
//        return value
//    case let .addition(left, right):
//        return evaluate(left) + evaluate(right)
//    case let .multiplication(left, right):
//        return evaluate(left) * evaluate(right)
//    }
//}
//evaluate(sum)
//evaluate(product)

//enum Calculation{
//    case integer(Int)
//    indirect case multiplication(Calculation, Calculation)
//    indirect case divison(Calculation, Calculation)
//}
//
//let five = Calculation.integer(5)
//let three = Calculation.integer(3)
//let product = Calculation.multiplication(five, three)
//let divide = Calculation.divison(product, five)
//
//func evaluate(_ expression: Calculation) -> Int{
//    switch expression{
//    case let .integer(val):
//        return val
//    case let .multiplication(LHS, RHS):
//        return evaluate(LHS) * evaluate(RHS)
//    case let .divison(LHS, RHS):
//        return evaluate(LHS) / evaluate(RHS)
//    }
//}
//
//evaluate(product)
//evaluate(divide)

///Structures
struct Resolution{
    var width  = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}
//
//let someResolution = Resolution()
//let someVideoMode = VideoMode()

//print("width : \(someResolution.height)\nheight : \(someResolution.width)")
//print("VideoModeHeight: \(someVideoMode.resolution.height)\nVideoModeWidth: \(someVideoMode.resolution.width)")
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
print(cinema.height)
cinema.height = 1000
print(cinema.height)
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = false
tenEighty.name = "Areef"
tenEighty.frameRate = 30.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 40.0
print(tenEighty.frameRate)
print(alsoTenEighty.frameRate)

//struct Point{
//    var x : Int
//    var y : Int
    
//    init(x: Int, y: Int) {
//        self.x = x
//        self.y = y
//    }
//}
//var pointA = Point(x: 1, y: 2)
//var pointB = pointA
//pointB.x = 10
//print(pointA.x)
//print(pointB.x)
//var hd = Resolution(width: 1920, height: 1080)
//var cinema = hd
//cinema.height = 2040
//cinema.width = 4000
//print("HDwidth: \(hd.width)\nHDheight: \(hd.height)")
//print("cinemaWidth: \(cinema.width)\ncinemaHeight: \(cinema.height)")
//let tenEighty = VideoMode()
//tenEighty.resolution = hd
//tenEighty.interlaced = true
//tenEighty.name = "1080i"
//tenEighty.frameRate = 25.0
//print(tenEighty.resolution)
//let alsoTenEighty = tenEighty
//alsoTenEighty.frameRate = 30.0
//print(tenEighty.frameRate)
//print(alsoTenEighty.frameRate)
//if tenEighty === alsoTenEighty{
//    print("refers to same instance")
//}

//generics
//struct swap<T>{
//    var a:T
//    var b:T
//    mutating func swapTwoValues(_ a: inout T, _ b: inout T){
//        let temp = a
//        a = b
//        b = temp
//    }
//}
//var check = swap(a: "Hii", b: "Hello")
//var str1 = "Hii"
//var str2 = "Hello"
//print("str1: \(str1), str2: \(str2)")
//check.swapTwoValues(&str1, &str2)
//print("str1: \(str1), str2: \(str2)")

//struct Stack<Element>{
//    var items:[Element] = []
//    mutating func push(_ item: Element){
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}
//var arr = [1,2,3,4,5]
//var check2 = Stack<String>()
//check2.push("venu")
//check2.push("Ramesh")
//check2.push("narine")
//check2.push("karan")
//print(check2)
//check2.pop()
//print(check2)
//var check3 = Stack<Double>()
//check3.push(1.1)
//check3.push(2.2)
//check3.push(3.3)
//check3.push(4.4)
//check3.push(5.5)
//print(check3)
//check3.pop()
//print(check3)
//
//extension Stack{
//    var peek : Element?{
//        return items.isEmpty ? nil : items[items.count - 1]
//    }
//}
//
//print(check2.peek ?? "nil")

//struct Stack<Element>:CustomStringConvertible{
//    var items:[Element] = []
//    
//    mutating func push(_ item:Element){
//        items.append(item)
//    }
//    
//    mutating func pop() -> Element?{
//        return items.removeLast()
//    }
//    
//    mutating func peek() -> Element?{
//        return items.last
//    }
//    
//    var description: String{
//        return "\(items)"
//    }
//}
//var stack = Stack<String>()
//stack.push("Nokia")
//stack.push("LG")
//stack.push("techno")
//stack.push("redmi")
//print(stack)
//stack.pop()
//print(stack)

