
import SwiftUI
import Combine

struct MainView: View {
    
    @StateObject private var viewModel = EventViewModel()
    
    var body: some View {
            
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Review")
                    .font(.title)
                    .bold()
                Text("It's time to review your event information before publishing it")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .padding(.vertical)
                
                ScrollView(.vertical) {
                    
                    VStack(alignment: .leading){
                        Text("Event Type").foregroundStyle(.secondary).bold()
                        HStack{
                            Image(systemName: "trophy")
                                .foregroundColor(appColor)
                            Text("Competitive Game").bold()
                            Spacer()
                            
                            HStack{
                                circleDesign(imageName: "lock.rotation.open").foregroundColor(.black)
                                Text("Public")
                                    .font(.system(size: 18))
                            }
                            .frame(width: 95, height: 28)
                            .background(appColor.opacity(0.2))
                            .cornerRadius(50)

                        }
                        HStack {
                            VStack(alignment: .leading , spacing: 8) {
                                Text("Event Dynamic")
                                    .bold()
                                    .font(.callout)
                                    .foregroundStyle(.secondary)
                                Text("Play within my Team").bold()
                            }
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
            }
            .padding(.leading, 16)
            .navigationTitle("Review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        print("Back button tapped")
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(appColor)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("Help button tapped")
                    }) {
                        Image(systemName: "questionmark.message")
                            .foregroundColor(appColor)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("Exit button tapped")
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(appColor)
                    }
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

