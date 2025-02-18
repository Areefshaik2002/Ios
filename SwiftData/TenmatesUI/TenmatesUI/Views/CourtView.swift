import SwiftUI

struct CourtView: View {
    let court: CourtCell
    var appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Court \(court.courtNumber)")
                    .font(.headline)
                Spacer()
                Text("\(court.singleOrDouble)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 80, height: 30).background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.15)).cornerRadius(30)
            }
            .padding(.bottom, 10)
            VStack(alignment: .leading){
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                    VStack(alignment: .leading) {
                        Text("\(court.weekDay), \(court.month) \(court.date), \(court.time)")
                        Text("\(court.duration) duration")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    Image(systemName: "location.north.circle")
                        .foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                    VStack(alignment: .leading) {
                        Text("\(court.location)")
                        Text("\(court.district), \(court.city), \(court.pincode)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color.init(red: 0.85, green: 1, blue: 1).opacity(0.05))
            HStack(spacing: -10) {
                Image("pic1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 3)

                Image("pic2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 3)

                Text("\(court.numberOfPlayers) players")
                    .font(.subheadline)
                    .padding(.leading, 15)

                Spacer()

                NavigationStack {
                    NavigationLink(destination: EditCoachNavigation()) {
                        Text("Edit Player").underline().foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                    }
                }
            }
        }
        .padding()
        .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.15))
        .cornerRadius(30)
        .padding(.horizontal)
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
            .frame(width: 360 )
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
            .frame(width: 360 )
            .background(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 1)
            )
            .cornerRadius(8)
    }
}

struct TableTennisAnimationView: View {
    @State private var paddleRotation: Double = -10
    @State private var ballPosition: CGPoint = CGPoint(x: 0, y: -50)
    @State private var ballOpacity: Double = 0
    @State private var movingRight: Bool = true

    var body: some View {
        ZStack {
            LinearGradient(colors: [.init(red: 0.85, green: 1, blue: 0).opacity(0.5), .black ], startPoint: .top, endPoint: .bottom)
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
                        .frame(width: 80, height: 180)
                        .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
                        .rotationEffect(.degrees(-190+paddleRotation))
                        .offset(x: 70, y: movingRight ? -30 : 40)
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



#Preview {
    MainView()
}
