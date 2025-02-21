
//
//  UseCasesForPlayerInfo.swift
//  TenmatesUI
//
//  Created by Shaik Areef on 19/02/25.
//

import SwiftUI

let backgroundColor:Color = Color.init(red: 0.85, green: 1, blue: 0).opacity(0.2)

struct labelDesign:View {
    let text:String
    var body: some View {
        Text(text)
            .padding(.horizontal,8)
            .font(.footnote)
            .frame(minHeight: 25)
            .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.2))
            .cornerRadius(20)
    }
}

struct textHeading: View {
    let text: String
    var body: some View {
        Text(text).foregroundStyle(.gray).padding(.vertical , 3)
    }
}

struct textValue:View {
    let text:String
    var body: some View {
        Text(text).padding(.vertical , -3)
    }
}

struct playerDetils : View {
    @StateObject private var viewModel = PlayerViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Image(viewModel.players[0].playerImage)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 150, height: 100)
                    .offset(x:-20)
                VStack(alignment: .leading) {
                    Text(viewModel.players[0].PlayerName)
                        .font(.title)
                        .bold()
                        .padding(.bottom,-2)
                    labelDesign(text: "Amateur")
                }
                .offset(x:-40)
                Spacer()
            }
            .padding(.vertical)
            textHeading(text: "Phone Number")
            textValue(text: viewModel.players[0].playerPhoneNumber)
            
            textHeading(text: "Email Address")
            textValue(text: viewModel.players[0].playerEmail)
            
            textHeading(text: "Clubs")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.players[0].playerClubs , id:\.self) {club in
                        labelDesign(text: club)
                    }
                }
            }
            Divider().padding(.vertical).foregroundStyle(.bar)
            
            VStack(alignment: .leading) {
                Text("Parent Info")
                    .bold()
                textHeading(text: "Name")
                textValue(text: viewModel.players[0].parentName)
                textHeading(text: "Phone Number")
                textValue(text: viewModel.players[0].parentPhoneNumber)
                textHeading(text: "Email Address")
                textValue(text: viewModel.players[0].parentEmail)
            }
        }
        .padding(.leading,10)
    }
}

struct Doubles:View {
    let match:RecentMatchesModel
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(match.matchDate), \(match.matchTime)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("\(match.matchName)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            
            VStack {
                HStack {
                    Image("pic1").resizable().frame(width: 40, height: 40).clipShape(Circle())
                    Image("pic3").resizable().frame(width: 40, height: 40).clipShape(Circle()) .offset(x: -20)
                }
                Text("Zendaya and Elizabeth").font(.caption).foregroundColor(.secondary)
            }
            .padding()
            .background(backgroundColor.opacity(0.5))
            .cornerRadius(15)
            
            Divider().frame(maxWidth: 170)
            
            VStack() {
                HStack {
                    Image("pic2").resizable().frame(width: 40, height: 40).clipShape(Circle())
                    Image("pic4").resizable().frame(width: 40, height: 40).clipShape(Circle()) .offset(x: -20)
                }
                Text("Tom and Matthew").font(.caption).foregroundColor(.secondary)
            }
            .padding()
            .cornerRadius(15)
        }
        .padding(10)
        .frame(width: 200)
        .border(backgroundColor, width: 1.5)
        .cornerRadius(20)
        
    }
}


struct Singles:View {
    let match:RecentMatchesModel
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(match.matchDate), \(match.matchTime)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("\(match.matchName)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            
            VStack {
                HStack {
                    Image("pic3").resizable().frame(width: 40, height: 40).clipShape(Circle())
                }
                Text("Zendaya").font(.caption).foregroundColor(.secondary)
            }
            .padding()
            .frame(width: 155)
            .background(backgroundColor.opacity(0.5))
            .cornerRadius(15)
            
            Divider().frame(maxWidth: 170)
            
            VStack {
                HStack {
                    Image("pic1").resizable().frame(width: 40, height: 40).clipShape(Circle())
                }
                Text("Elizabeth").font(.caption).foregroundColor(.secondary)
            }
            .padding()
            .cornerRadius(15)
        }
        .padding(10)
        .frame(width: 200)
        .border(backgroundColor, width: 1.5)
        .cornerRadius(20)
        
    }
}
struct EventsInCommon : View{
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                Text("Competitive Game")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                Spacer()
                Text("Pending")
                    .frame(width: 100, height: 40)
                    .background(Color.gray)
                    .cornerRadius(20)
                    .padding(.trailing, 30)
            }
            .padding(.bottom, 20)
            HStack{
                Image(systemName: "calendar")
                    .font(.system(size: 25))
                    .foregroundColor(appColor)
                Text("Wed, 20 Nov 06:30 PM")
                    .padding(.leading, 20)
            }
            .padding(.bottom, 10)
            
            HStack{
                Image(systemName: "book")
                    .font(.system(size: 25))
                    .foregroundColor(appColor)
                Text("5 courts")
                    .padding(.leading, 20)
            }
            .padding(.bottom, 10)
            
            HStack{
                Image(systemName: "matter.logo")
                    .font(.system(size: 25))
                    .foregroundColor(appColor)
                Text("Pickle panthers")
                    .padding(.leading, 20)
            }
            .padding(.bottom, 20)
            
            HStack{
                Images(imageName: "pic1")
                Images(imageName: "pic2")
                    .offset(x: -30)
                Images(imageName: "pic3")
                    .offset(x: -50)
                Text("Cristina, Louise + 32 players")
                    .foregroundColor(.secondary)
                    .offset(x: -40)
            }
        }
        .frame(width: 380, height: 300)
        .background(Color(appColor).opacity(0.1))
        .cornerRadius(30)
      
    }
}

struct CommonTeams: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Common Teams")
                .bold()
                .font(.system(size: 22))
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                circleDesign(imageName: "medal").foregroundColor(.black).font(.system(size: 16))
                Text("Power circuit League")
                    .font(.headline)
                    .bold()
            }
            .frame(width: 240, height: 50)
            .background(Color(appColor.opacity(0.2)))
            .cornerRadius(50)
        }
    }
}

struct RecentCourts: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "location")
                    .foregroundColor(appColor)
                    .font(.system(size: 32))
                VStack(alignment: .leading){
                    Text("web Bridge pickel ball courts")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .frame(width: 250, height: 10)
                        .padding(.leading, -5)
                    Text("Orlando, FL")
                        .font(.system(size: 18))
                        .foregroundColor(.secondary)
                }
                Image(systemName: "arrow.up.forward.bottomleading.rectangle")
                    .foregroundColor(appColor)
                    .font(.system(size: 30))
            }
            Image("maps")
                .resizable()
                .frame(width: 340, height: 190)
                .cornerRadius(10)
        }
        .frame(width: 360, height: 300)
        .background(Color(appColor).opacity(0.1))
    }
}
#Preview {
    CommonTeams()
}
