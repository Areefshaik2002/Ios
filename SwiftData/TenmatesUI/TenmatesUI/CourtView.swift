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
#Preview {
    MainView(courts: courts)
}
