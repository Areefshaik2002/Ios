//
//  StacksInSwiftUI.swift
//  SwiftUIWork
//
//  Created by Shaik Areef on 10/02/25.
//

import Foundation
import SwiftUI

//Vertical stack - VStack
//Horizontal stack - HStack

struct StacksInSwiftUI: View {
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack(spacing : 32) {
                
                Label("Discover new music", systemImage: "magnifyingglass")
                    .font(.system(size: 24, weight: .ultraLight, design: .default))
                    .frame(width: 390, height: 40)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                
                
                spotify(headLine: "Your top genres", rectColor1: .orange, text1: "Hip-Hop", rectColor2: .purple, text2: "pop", image1Name: "Hiphop", image2Name: "pop")
                spotify(headLine: "Featured podcast categories", rectColor1: .blue, text1: "Joe Rogan\nexperiance", rectColor2: .green, text2: "side+", image1Name: "jrepodcast", image2Name: "sidemen")
                spotify(headLine: "Browse All", rectColor1: .brown, text1: "Hip-hop", rectColor2: .red, text2: "pop", image1Name: "Hiphop", image2Name: "pop")
                
                Spacer()
                
                HStack(spacing:35){
                    windowImages(windowImage: "house")
                    windowImages(windowImage: "heart")
                    windowImages(windowImage: "menucard.fill")
                    windowImages(windowImage: "arrow.down.circle.fill")
                    windowImages(windowImage: "person.crop.circle.fill")
                }
            }
            
        }
    }
}
#Preview {
    StacksInSwiftUI()
}
 
struct spotify : View {
    
    var headLine : String
    var rectColor1 : Color
    var text1 : String
    var rectColor2 : Color
    var text2 : String
    var image1Name : String
    var image2Name : String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(headLine)
            
            HStack {
                ZStack(alignment: .bottomTrailing) {
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(rectColor1)
                            .frame(width: 190, height: 100)
                            .cornerRadius(10)
                        Text(text1)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                    Image(image1Name)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .rotationEffect(.degrees(30))
                        .offset(x: 16, y: 0)
                }
                .clipped()
                ZStack(alignment: .bottomTrailing) {
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(rectColor2)
                            .frame(width: 190, height: 100)
                            .cornerRadius(10)
                        Text(text2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                   Image(image2Name)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .rotationEffect(.degrees(30))
                        .offset(x: 16, y: 0)
                }
                .clipped()
            }
        }
    }
}

struct windowImages : View {
    
    var windowImage : String
    
    var body: some View {
        Image(systemName: windowImage)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
    }
}
