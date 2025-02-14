////
////  ContentView.swift
////  GridsInSwiftUI
////
////  Created by Shaik Areef on 14/02/25.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        ScrollView(.horizontal){
//            LazyHStack{
//                Grid(alignment: .bottom, horizontalSpacing: 10, verticalSpacing: 10) {
//                    GridRow {
//                        Text("Row 1")
//                        ForEach(0..<2) { _ in
//                            Rect(color: .black)
//                        }
//                    }
//                    GridRow {
//                        Text("Row 2")
//                        ForEach(0..<5) { _ in
//                            Rect(color: .green)
//
//                        }
//                    }
//                    GridRow {
//                        Text("Row 3")
//                        ForEach(0..<4) { _ in
//                            Rect(color: .blue)
//
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//struct Rect: View {
//    var color : Color
//    var body: some View {
//        Rectangle()
//            .frame(width: 70, height: 70)
//            .foregroundColor(color)
//    }
//}
//#Preview {
//    ContentView()
//}
