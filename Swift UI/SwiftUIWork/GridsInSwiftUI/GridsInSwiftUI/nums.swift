//
//  nums.swift
//  GridsInSwiftUI
//
//  Created by Shaik Areef on 14/02/25.
//

import SwiftUI

struct ContentView: View {
    
    var digits: Int
    
    init(digits: Int) {
        self.digits = digits
        print("clicked on \(digits)")
    }
    
    var body: some View {
        Text("clickedOn(digit: \(digits))")
        VStack {
            Image(systemName: "trash")
                .frame(width: 300, height: 300)
        }
    }
}
