import SwiftUI

struct EventListView: View {

    let eventsByMonth: [String: [Event]] = loadEvents()

    var body: some View {
    
        NavigationView{
            List{
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        circleSetUp(inText: "JP")
                        circleSetUp(inText: "K1")
                            .offset(x:-15)
                        Image("leaf")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 5)
                            .offset(x:-28)
                        Spacer()
                        Button(action: {
                            print("button tapped")
                        }){
                            Text("+")
                                .foregroundColor(.init(red: 180/255, green: 215/255, blue: 0/255))
                                .font(.system(size: 55))
                                .fontWeight(.light)
                        }
                    }
                    .padding(.bottom, 0)
                    Text("Schedule")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                }
                ForEach(eventsByMonth.keys.sorted(by: {
                    guard let date1 = monthYearDate(from: $0),
                          let date2 = monthYearDate(from: $1) else{
                        return false
                    }
                    return date1 < date2
                }), id : \.self){ month in
                    Section(header: Text(month)
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 45)
                        .background(Color.init(red: 180/255, green: 215/255, blue: 0/255))
                        .listRowInsets(EdgeInsets())
                    ){
                        ForEach(eventsByMonth[month] ?? [], id: \.name){ event in
                            NavigationLink(destination: EventDetailView(event: event)){
                                EventRowView(event: event)
                                    .padding(.horizontal, -20)
                                    .padding(.leading, 25)
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .listSectionSeparator(.hidden)
            .listRowBackground(Color.white)
        }
        
    }
}

struct EventRowView: View {
    let event: Event
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(formattedDay(from: event.date))
                    .font(.system(size: 26))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text(formattedWeekday(from: event.date))
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundColor(.black)
            }
            Divider()
                .frame(width: 50, height: 80)
            VStack(alignment: .leading) {
                Text(event.time)
                    .font(.headline)
                Text(event.name)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            Spacer()
            
            circleSetUp(inText: "JP")
        }
    }
}

#Preview{
    EventListView()
}
