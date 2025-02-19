import SwiftUI
import Combine

struct MainView: View {
    
    @StateObject private var viewModel = EventViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 8) {
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
                                Text("Public")
                            }
                        }
                    }
                    .offset(y:-7)
                    
                    HStack {
                        VStack(alignment: .leading , spacing: 8) {
                            Text("Event Dynamic")
                                .bold()
                                .font(.callout)
                                .foregroundStyle(.secondary)
                            Text("Play within my Team").bold()
                        }
                        .padding(.top , -8)
//                        Toggle("", isOn: $viewModel.isWithInTeam).tint(appColor)
                    }
                }
                .padding(.horizontal , 10)
                
                if !(viewModel.isWithInTeam) {
                    teamView()
                }
                if viewModel.isCoachAvailable {
                    coachView()
                }
                if viewModel.isAudienceAvailable {
                    AudienceViewEdit()
                }
                
                Text("Courts")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                ForEach(viewModel.courts, id: \.courtNumber) { court in
                    CourtView(court: court)
                }
                .padding(.bottom, 20)
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
            
            NavigationLink(destination: NavigatedView(courtViewModel: viewModel)) {
                GreenButton(buttonLabel: "Publish now")
            }
            
            NavigationLink(destination: NavigatedView(courtViewModel: viewModel)) {
                BlackButton(buttonLabel: "Save as a Draft")
            }
        }
    }
}
#Preview {
    MainView()
}
