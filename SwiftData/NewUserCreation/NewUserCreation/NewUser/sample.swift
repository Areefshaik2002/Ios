import SwiftUI

struct SampleView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                NavigationLink(destination: NewUserCreationPlayerView()) {
                    button(text: "New Player")
                }
                NavigationLink(destination: NewUserCreationCoachView()) {
                    button(text: "New Coach")
                }
                NavigationLink(destination: NewUserCreationAudienceView()) {
                    button(text: "New Audience")
                }
            }
            .padding()
        }
    }
    
    func button(text: String) -> some View {
        Text(text)
            .frame(width: 358, height: 48)
            .font(.headline)
            .foregroundColor(.black)
            .background(Color(appColor))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 1)
            )
            .cornerRadius(8)
    }
}
