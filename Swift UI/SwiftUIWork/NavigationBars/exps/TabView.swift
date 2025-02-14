//
//  TabView.swift
//  exps
//
//  Created by Shaik Areef on 14/02/25.
//

import SwiftUI

struct BottomTabView: View {
    
    @State private var selectedTabIndex = 0
    
    var body: some View {
        VStack{
            TabView(selection: $selectedTabIndex){
                VStack{
                    Text("Home view")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .background(Color.blue)
                }
                .tag(0)
                
                VStack{
                    Text("Search view")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .background(Color.red)
                }
                .tag(1)
                
                VStack{
                    Text("Profile View")
                        .font(.largeTitle)
                        .foregroundColor(Color.green)
                        .background(Color.black)
                }
                .tag(2)
                
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack{
                Button(action: {
                    selectedTabIndex = 0
                }){
                    VStack{
                        Image(systemName: "house")
                        if selectedTabIndex == 0{
                            Text("Home")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding(.leading, 40)
                Spacer()
                Button(action: {
                    selectedTabIndex = 1
                }){
                    VStack{
                        Image(systemName: "magnifyingglass")
                        if selectedTabIndex == 1{
                            Text("Search")
                                .foregroundColor(.red)
                        }
                    }
                }
                Spacer()
                Button(action: {
                    selectedTabIndex = 2
                }){
                    VStack{
                        Image(systemName: "person.circle")
                        if selectedTabIndex == 2{
                            Text("Profile")
                                .foregroundColor(.green)
                        }
                    }
                }
                .padding(.trailing, 40)
            }
            .padding()
            .background(Color(.systemGray6))
        }
    }
}
