import SwiftUI
import Combine

struct MainView: View {
    
    var viewModel = EventViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false){

                EventInitialDetailView(event: viewModel.event?.event)
                
                if (viewModel.event?.event?.opponentTeamName != nil) {
                    teamView()
                }
                if viewModel.event?.event?.eventCoaches?.first?.isCoach != nil {
                    coachView(event: viewModel.event?.event)
                }
                if viewModel.event?.event?.withAudience ?? false {
                    AudienceViewEdit()
                }
                
                Text("Courts")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                ForEach(viewModel.event?.event?.eventCourts ?? [], id: \.id) { court in
                    CourtView(eventCourt: court)
//                    CourtView(event: viewModel.event /*eventCourt: viewModel.event?.event?.eventCourts*/)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("Review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
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
            
            NavigationLink(destination: NavigatedView(ViewModel: EventViewModel())) {
                GreenButton(buttonLabel: "Publish now")
            }
            
            NavigationLink(destination: NavigatedView(ViewModel: EventViewModel())) {
                BlackButton(buttonLabel: "Save as a Draft")
            }
        }
        .task{
            await viewModel.fetchEvent(eventID: "3926")
        }
    }
}
#Preview {
    MainView()
}
