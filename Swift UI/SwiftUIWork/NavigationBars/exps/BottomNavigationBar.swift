////
////  ContentView.swift
////  exps
////
////  Created by Shaik Areef on 14/02/25.
////
//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var selectedTab = 0
//
//    var body: some View {
//        VStack {
//            TabView(selection: $selectedTab) {
//                VStack {
//                    Text("Home View")
//                        .font(.largeTitle)
//                        .foregroundColor(.white)
//                        .background(Color.blue)
//                }
//                .tag(0)
//
//                VStack {
//                    Text("Search View")
//                        .font(.largeTitle)
//                        .foregroundColor(.white)
//                        .background(Color.gray)
//                }
//                .tag(1)
//
//                VStack {
//                    Text("Profile View")
//                        .font(.largeTitle)
//                        .foregroundColor(.white)
//                        .background(Color.green)
//                }
//                .tag(2)
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//
//            HStack {
//                Button(action: {
//                    selectedTab = 0
//                }) {
//                    VStack {
//                        Image(systemName: "house.fill")
//                        if selectedTab == 0 {
//                            Text("Home")
//                                .foregroundColor(.blue)
//                        }
//                    }
//                }
//                .frame(maxWidth: .infinity)
//
//                Button(action: {
//                    selectedTab = 1
//                }) {
//                    VStack {
//                        Image(systemName: "magnifyingglass")
//                        if selectedTab == 1 {
//                            Text("Search")
//                                .foregroundColor(.gray)
//                        }
//                    }
//                }
//                .frame(maxWidth: .infinity)
//
//                Button(action: {
//                    selectedTab = 2
//                }) {
//                    VStack {
//                        Image(systemName: "person.fill")
//                        if selectedTab == 2 {
//                            Text("Profile")
//                                .foregroundColor(.green)
//                        }
//                    }
//                }
//                .frame(maxWidth: .infinity)
//            }
//            .padding()
//            .background(Color(.systemGray6))
//        }
//    }
//}
