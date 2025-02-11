//
//  ContentView.swift
//  SwiftUIWork
//
//  Created by Shaik Areef on 10/02/25.
//

import SwiftUI

struct TextBasics: View {
    var body: some View {
        VStack {
            Text("Hello, world!, i am learning swiftUI and i am very excited")
                .font(.system(size: 26, weight: .bold, design: .monospaced))
                .foregroundColor(.red)
//                .underline()
//                .strikethrough()
                .multilineTextAlignment(.leading)
                .opacity(0.8)
        }
        .padding()
    }
}

#Preview {
    TextBasics()
}
