//import SwiftUI
//
//import SwiftUI
//
//struct EventListView: View {
//    let eventsByMonth: [(month: String, events: [Event])] = loadEvents()
//        .sorted { monthYearDate(from: $0.key) ?? Date() < monthYearDate(from: $1.key) ?? Date() }
//        .map { ($0.key, $0.value) }
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                HeaderView()
//                
//                TabView{
//                    ForEach(eventsByMonth, id: \.month) { monthData in
//                        VStack(alignment: .leading, spacing: 0) {
//                            Text(monthData.month)
//                                .font(.system(size: 20, weight: .bold))
//                                .foregroundColor(.white)
//                                .padding()
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .background(Color(red: 180/255, green: 215/255, blue: 0/255))
//                            
//                            TabView {
//                                VStack(spacing: 10) {
//                                    ForEach(monthData.events, id: \.name) { event in
//                                        NavigationLink(destination: EventDetailView(event: event)) {
//                                            EventRowView(event: event)
//                                                .padding(.horizontal, 20)
//                                        }
//                                    }
//                                }
//                                .padding(.top, 10)
//                            }
//                        }
//                        .padding(.bottom, 10)
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//            }
//        }
//    }
//}
//struct EventRowView: View {
//    let event: Event
//    
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading) {
//                Text(formattedDay(from: event.date))
//                    .font(.system(size: 22))
//                    .fontWeight(.semibold)
//                    .foregroundColor(.black)
//                Text(formattedWeekday(from: event.date))
//                    .font(.system(size: 14))
//                    .fontWeight(.light)
//                    .foregroundColor(.black)
//            }
//            Divider()
//                .frame(width: 50, height: 65)
//            VStack(alignment: .leading) {
//                Text(event.time)
//                    .font(.headline)
//                    .foregroundColor(.black)
//                Text(event.name)
//                    .font(.subheadline)
//                    .foregroundColor(.black)
//            }
//            Spacer()
//            
//            circleSetUp(inText: "JP")
//        }
//    }
//}
//struct HeaderView: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                circleSetUp(inText: "JP")
//                    .padding(.leading, 10)
//                circleSetUp(inText: "K1")
//                    .offset(x: -15)
//                Image("leaf")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 35, height: 35)
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                    .shadow(radius: 5)
//                    .offset(x: -28)
//                Spacer()
//                Button(action: {
//                    print("button tapped")
//                }) {
//                    Text("+")
//                        .foregroundColor(.init(red: 180/255, green: 215/255, blue: 0/255))
//                        .font(.system(size: 40))
//                        .fontWeight(.light)
//                        .padding(.trailing, 10)
//                }
//            }
//            Text("Schedule")
//                .font(.system(size: 40))
//                .fontWeight(.bold)
//                .padding(.leading, 10)
//        }
//        .padding()
//        .background(Color.white)
//    }
//}
//#Preview {
//    EventListView()
//}
