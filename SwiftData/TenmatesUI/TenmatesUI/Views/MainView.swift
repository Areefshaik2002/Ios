import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = CourtViewModel()
    var appColor: Color = Color.init(red: 0.75, green: 0.9, blue: 0)
    
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
