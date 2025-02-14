////
////  GridsWork.swift
////  GridsInSwiftUI
////
////  Created by Shaik Areef on 14/02/25.
////
//
//import SwiftUI
//
//struct GridView: View {
//    
//    let rows = Array(repeating: GridItem(.fixed(100)), count: 11)
//    
//    var body: some View {
//        ScrollView(.vertical){
////            VStack {
//                ScrollView(.horizontal){
//                    LazyHGrid(rows: rows, spacing: 10){
//                        GridRow{
//                            Color.clear
//                                .gridCellUnsizedAxes([.horizontal, .vertical])
//                            ForEach(1..<11){ column in
//                                Text("C\(column)")
//                            }
//                        }
//                        ForEach(1..<11){ row in
//                            GridRow{
//                                Text("R\(row)")
//                                ForEach(1..<11){  _ in
//                                    Circle().frame(width: 50, height: 50).foregroundStyle(Color.mint)
//                                }
//                            }
//                        }
//                    }
//                }
////            }
//        }
//    }
//}
//#Preview{
//    GridView()
//}
//
//struct hehe: View {
//    var body: some View {
//        GridRow{
//            ForEach(0..<5){ _ in
//                Text("*")
//                    .font(.system(size: 30, weight: .bold))
//            }
//        }
//    }
//}
