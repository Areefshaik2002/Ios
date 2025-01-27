//
//  main.swift
//  InputStatementExp
//
//  Created by Shaik Areef on 15/01/25.
//


import Foundation

print("enter a number to check if its a even or odd: ")
if let num = readLine(), let value = Int(num){
    let val = value % 2
    if val == 0{
        print("\(value) is a even number")
    }else{
        print("\(value) is a odd number")
    }
}



