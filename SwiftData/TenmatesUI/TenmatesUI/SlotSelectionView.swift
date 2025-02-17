//
//  SlotSelectionView.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 17/02/25.
//

import SwiftUI

struct SlotSelectionView: View {
    var body: some View {
        Text("SlotSelectionView")
    }
}
struct EditCoachNavigation: View{
    var body: some View{
        Text("Hello")
    }
}
struct Images: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 35, height: 35)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 3)
    }
}
struct circleDesign: View {
    var imageName: String
    var body: some View {
        Circle()
            .fill(Color.init(red: 0.75, green: 0.9, blue: 0))
            .frame(width: 30, height: 30)
            .overlay(content: {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            })
    }
}

struct GreenButton: View {
    
    var buttonLabel: String
    
    var body: some View {
        Text(buttonLabel)
            .font(.headline)
            .foregroundColor(.black)
            .padding()
            .frame(width: 330 )
            .background(Color.init(red: 0.85, green: 1, blue: 0))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 1)
            )
            .cornerRadius(8)
    }
}

struct BlackButton: View {
    
    var buttonLabel: String
    
    var body: some View {
        Text(buttonLabel)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 330 )
            .background(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 1)
            )
            .cornerRadius(8)
    }
}

struct ViewSchedule: View {
    var body: some View {
        Text("View Schedule")
    }
}

struct ViewEventDetails: View {
    var body: some View {
        Text("View Event Details")
    }
}

import SwiftUI

struct TableTennisAnimationView: View {
    @State private var paddleRotation: Double = -10
    @State private var ballPosition: CGPoint = CGPoint(x: 0, y: -50)
    @State private var ballOpacity: Double = 0
    @State private var movingRight: Bool = true

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

                ZStack {
                    Image(systemName: "tennis.racket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 120)
                        .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
                        .rotationEffect(.degrees(paddleRotation))
                        .offset(x: -70, y: movingRight ? 30 : -20)
                        .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: movingRight)

                    
                    Image(systemName: "tennis.racket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 120)
                        .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
                        .rotationEffect(.degrees(-190+paddleRotation))
                        .offset(x: 70, y: movingRight ? -20 : 30)
                        .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: movingRight)

                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                        .offset(x: ballPosition.x, y: ballPosition.y)
                        .opacity(ballOpacity)
                        .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: ballPosition)
                }
                .frame(width: 250, height: 180)
            }
        }
        .onAppear {
            paddleRotation = 10
            ballOpacity = 1

            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { _ in
                movingRight.toggle()
                ballPosition = movingRight ? CGPoint(x: 60, y: 20) : CGPoint(x: -60, y: -20)
            }
        }
    }
}

