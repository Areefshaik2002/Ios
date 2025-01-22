import Foundation

let actualName = "Areef"
let name = readLine()

enum Typo:Error{
    case spellingMistake
    case invalidFormat
}

func typoCheck()throws{
    let spellingMistake = true
    let invalidFormat = false
    
    if spellingMistake{
        throw Typo.spellingMistake
    }else if invalidFormat{
        throw Typo.invalidFormat
    }
}

do{
    try typoCheck()
}catch Typo.spellingMistake{
    print("make sure there are no spelling mistakes")
}catch Typo.invalidFormat{
    print("invalid format")
}catch{
    print("unknown error")
}

