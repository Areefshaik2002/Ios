import Foundation

func getODD(arr: [Int]) -> [Int] {
    var result:[Int] = []
    for num in arr {
        var n = num
        while n % 2 == 0 {
            n /= 2
        }
        result.append(n)
    }
    return result
}
print(getODD(arr: [2, 24, 36, 48, 50]))


func getOdd(arr: [Int]) -> [Int] {
    return arr.map{ num in
        var n = num
        while n % 2 == 0 {
            n/=2
        }
        return n
    }
}
print(getOdd(arr: [2, 24, 17, 48, 50]))
