import SwiftUI

struct EventDetailView: View {
    let event: Event
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.gray, .gray]), startPoint: .top, endPoint: .bottom)
                .opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("\(formattedEventDate(from: event.date))")
                    .font(.title3)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .padding(.trailing, 100)
                HStack{
                    Image(systemName: "clock")
                    Text(event.time)
                        .font(.title3)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .padding(.trailing, 100)
                }
                Text(event.name)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.trailing, 100)
                Text("\(event.location)")
                    .font(.system(size: 16))
                    .padding(.trailing, 100)
                HStack{
                    Image("map")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 130)
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .cornerRadius(16)
                    VStack(alignment: .leading){
                        Text("Bike")
                            .bold()
                        Text("vittal rao nagar, Madhapur, Hyderabad, Telangana, 500081")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 14))
                        Button(action: {
                            print("location button")
                        }){
                            Text("Directions")
                                .foregroundColor(.black)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .frame(width: 140, height: 20, alignment: .center)
                                .cornerRadius(60)
                                .background(Color.init(red: 180/255, green: 215/255, blue: 0/255))
                        }
                    }
                }
            }
            .frame(width: 380, height: 250, alignment: .center)
            .background(Color.white)
            .cornerRadius(16)
            .navigationTitle("Event")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(red: 180/255, green: 215/255, blue: 0))
                            .frame(width: 30, height: 30)
                            .font(.system(size: 24, weight: .bold))
                    }
                }
            }
        }
    }
}

struct circleSetUp: View {
    var inText: String
    var body: some View {
        Circle()
            .fill(Color.Resolved(red: 0/255, green: 100/255, blue: 0/255))
            .frame(width: 30, height: 30)
            .overlay(Text(inText).foregroundColor(.white).fontWeight(.semibold))
    }
}

