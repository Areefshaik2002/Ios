//
//  ContentView.swift
//  NavigationStacks
//
//  Created by Shaik Areef on 17/03/25.
//

import SwiftUI

struct ContentView: View {
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            navigationbButton
                .navigationTitle("Navigation stack")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: String.self){ value in
                    if value == "DetailView" {
                        viewAfterNavigation
                    }
                }
        }
        
    }
    
    var viewAfterNavigation: some View {
        Text("after navigation")
            .frame(width: 200, height: 50, alignment: .center)
            .background(.blue)
            .cornerRadius(12)
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .bold))
    }
    
    var navigationbButton: some View {
        Button("Go to another view"){
            path.append("DetailView")
        }
        .frame(width: 200, height: 50, alignment: .center)
        .background(.green)
        .cornerRadius(12)
        .foregroundColor(.white)
        .font(.system(size: 18, weight: .bold))
            
    }
}


#Preview {
    ContentView()
}
