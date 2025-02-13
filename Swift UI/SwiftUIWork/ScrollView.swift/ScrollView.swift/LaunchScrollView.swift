import SwiftUI

struct EventListView: View {
    
    let eventsByMonth: [String: [Event]] = loadEvents()
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading, spacing: 0){
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        circleSetUp(inText: "JP")
                            .padding(.leading, 10)
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
                                .font(.system(size: 40))
                                .fontWeight(.light)
                                .padding(.trailing, 10)
                        }
                    }
                    Text("Schedule")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                }
                .padding()
                .background(Color.white)
                
                ScrollView(.horizontal){
                    LazyHStack(spacing: 0){
                        ForEach(eventsByMonth.keys.sorted(by: {
                            guard let date1 = monthYearDate(from: $0),
                                  let date2 = monthYearDate(from: $1) else{
                                return false
                            }
                            return date1 < date2
                        }), id : \.self){ month in
                            VStack{
                                Text(month)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 45)
                                    .background(Color.init(red: 190/255, green: 215/255, blue: 0/255))
                                    .listRowInsets(EdgeInsets())
                                    ScrollView(.vertical){
                                        LazyVStack{
                                            ForEach(eventsByMonth[month] ?? [], id: \.name){ event in
                                                NavigationLink(destination: EventDetailView(event: event)){
                                                    EventRowView(event: event)
                                                        .padding(.leading, 25)
                                                        .padding(.trailing, 25)
                                                }
                                            }
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width)
                        }
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
    }
}
struct EventRowView: View {
    let event: Event
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(formattedDay(from: event.date))
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text(formattedWeekday(from: event.date))
                    .font(.system(size: 14))
                    .fontWeight(.light)
                    .foregroundColor(.black)
            }
            Divider()
                .frame(width: 50, height: 65)
            VStack(alignment: .leading) {
                Text(event.time)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(event.name)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            Spacer()
            
            circleSetUp(inText: "JP")
        }
    }
}

#Preview {
    EventListView()
}
