import SwiftUI
import Combine

struct CourtView: View {
    let court: CourtCell
    var appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)
    
    var body: some View {
        VStack (alignment: .leading){
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
            .background(appColorGradient)
            .cornerRadius(10)
            .padding(.horizontal)
        }
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

struct EditAudienceView: View {
    var body: some View {
        Text("Audience Edit View")
    }
}

struct coachView: View {
    var appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("Coach")
                    .foregroundStyle(.secondary)
                    .bold()
                HStack {
                    HStack {
                        Images(imageName: "pic1")
                        Text("Tom").foregroundStyle(.secondary)
                    }
                    Spacer()
                    NavigationLink(destination: EditCoachNavigation()) {
                        Text("Edit Coach").underline().accentColor(appColor)
                    }
                }
            }
            .padding(.all,10)
        }
    }

struct AudienceViewEdit: View {
    var appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Audience")
                .foregroundStyle(.secondary)
                .bold()
            HStack {
                HStack {
                    Images(imageName: "pic1")
                    Images(imageName: "pic2")
                        .offset(x: -14)
                    Images(imageName: "pic1")
                        .offset(x: -28)
                    Images(imageName: "pic2")
                        .offset(x: -42)
                    Text("32 spectators").foregroundStyle(.secondary)
                        .offset(x: -42)
                }
                Spacer()
                NavigationLink(destination: EditAudienceView()) {
                    Text("Edit Audience").underline().accentColor(appColor)
                }
            }
        }
        .padding(.all,10)
    }
}

struct teamView: View {
    @StateObject private var viewModel = EventViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Team").foregroundStyle(.secondary).bold()
            HStack{
                Text("The Galactic Federation of PickleBall Pioneers")
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .bold()
                Spacer()
                HStack{
                    circleDesign(imageName: "medal").foregroundColor(.black)
                    Text("Spin Shot League")
                        .font(.caption)
                        .bold()
                }
                .padding(.all, 5)
                .frame(width: 170)
                .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.2))
                .cornerRadius(50)
            }
            .padding()
            .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.1))
            .cornerRadius(10)
        }
        .padding(.all,10)
    }
}
struct TableTennisAnimationView: View {
    @State private var scaleEffect: CGFloat = 0.1
    @State private var opacity: Double = 0.1
    @State private var showSparkles: Bool = false
    @State private var paddleRotation: Double = -10
    @State private var movingRight: Bool = true
    var appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)


    var body: some View {
        ZStack {
            LinearGradient(colors: [appColor, .black],
                           startPoint: .top, endPoint: .bottom).opacity(0.6)
                .ignoresSafeArea()

            VStack {
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 45, height: 45)
                        .scaleEffect(scaleEffect)
                        .opacity(opacity)
                        .animation(.easeInOut(duration: 1).delay(0.3), value: scaleEffect)
                    
                    Image(systemName: "tennis.racket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
                        .rotationEffect(.degrees(-190+paddleRotation))
                        .offset(x: 70, y: movingRight ? -30 : 40)
                        .animation(.easeInOut(duration: 0.6), value: movingRight)
                    
                    Image(systemName: "tennis.racket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
                        .rotationEffect(.degrees(paddleRotation))
                        .offset(x: -70, y: movingRight ? 30 : -20)
                        .animation(.easeInOut(duration: 0.6), value: movingRight)

                    if showSparkles {
                        ForEach(0..<100, id: \.self) { index in
                            Circle()
                                .fill(Color.init(red: 0.85, green: 1, blue: 0))
                                .frame(width: 10, height: 10)
                                .offset(x: CGFloat.random(in: -100...100),
                                        y: CGFloat.random(in: -100...90))
                                .opacity(1 - Double(index) / 10)
                                .scaleEffect(1 + CGFloat(index) * 0.1)
                                .animation(.easeOut(duration: 0.1).repeatForever(autoreverses: true).delay(Double(index) * 0.05), value: showSparkles)
                        }
                    }
                    
                    Text("The Event has\nbeen created!")
                        .font(.system(size: 30, weight: .bold))
                        .frame(width: 260, height: 100)
                        .padding(.top, 300)
                        .scaleEffect(scaleEffect)
                        .animation(.easeInOut(duration: 1).delay(0.3), value: scaleEffect)
                    
                }
                .frame(width: 200, height: 200)
                Spacer()
            }
        }
        .onAppear {
            scaleEffect = 1
            opacity = 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showSparkles = true
            }
        }
    }
}

