import SwiftUI

struct MainView: View {
    
    let courts: [CourtCell]
    var appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)
    
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading , spacing: 8) {
                    Text("Review")
                        .font(.title)
                        .bold()
                    Text("It's time to review your event information before publishing it")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical)
                
                VStack(alignment: .leading){
                    Text("Event Type").foregroundStyle(.secondary).bold()
                    HStack{
                        Image(systemName: "trophy")
                            .foregroundColor(appColor)
                        Text("Competitive Game").bold()
                        Spacer()
                        ZStack {
                            Color.init(red: 0.85, green: 1, blue: 0).opacity(0.2).cornerRadius(50)
                                .frame(width: 95, height: 38)
                            HStack{
                                circleDesign(imageName: "lock.rotation.open").foregroundColor(.black)
                                Text("Public").bold()
                            }
                        }
                    }
                    .offset(y:-7)
                    
                    VStack(alignment: .leading , spacing: 8) {
                        Text("Event Dynamic")
                            .bold()
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text("Play within my Team").bold()
                    }
                    .padding(.top , -8)
                }
                .padding(.horizontal , 10)
                
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
                        .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.2))
                        .cornerRadius(50)
                    }
                    .padding()
                    .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.1))
                    .cornerRadius(10)
                }
                .padding(.all,10)
                
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
                            Text("Edit Coach").underline().foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                        }
                    }
                }
                .padding(.all,10)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Audience")
                        .foregroundStyle(.secondary)
                        .bold()
                    HStack {
                        HStack {
                            Images(imageName: "pic1")
                            Images(imageName: "pic2")
                                .offset(x: -14)
                            Images(imageName: "pic2")
                                .offset(x: -28)
                            Images(imageName: "pic1")
                                .offset(x: -42)
                            Text("32 spectators").foregroundStyle(.secondary)
                                .offset(x: -42)
                        }
                        Spacer()
                        NavigationLink(destination: EditCoachNavigation()) {
                            Text("Edit Audience").underline().foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                        }
                    }
                }
                .padding(.all,10)
                ForEach(courts, id: \.courtNumber) { court in
                        CourtView(court: court)
                }
                .padding(.bottom, 20)
                
                NavigationLink(destination: NavigatedView(), label: {
                    GreenButton(buttonLabel: "Publish now")
                })
                
                NavigationLink(destination: NavigatedView(), label: {
                    BlackButton(buttonLabel: "Save as a Draft")
                })
            }
            .navigationTitle("Review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        print("Back button tapped")
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("Help button tapped")
                    }) {
                        Image(systemName: "questionmark.message")
                            .foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("Exit button tapped")
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(.init(red: 0.85, green: 1, blue: 0))
                    }
                }
            }
        }
    }
}

#Preview {
    MainView(courts: courts)
}
