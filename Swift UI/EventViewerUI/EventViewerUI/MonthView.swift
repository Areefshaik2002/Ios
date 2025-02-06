import SwiftUI

struct MonthView: View{
    
    @StateObject private var dataLoader = EventLoader()
    
    var eventsByMonth: [String: [Event]]{
        Dictionary(grouping: dataLoader.events){
            event in
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM yyyy"
            return formatter.string(from: convertStringToDate(event.date))
        }
    }
    
    var sortedMonths: [String]{
        eventsByMonth.keys.sorted{$0 < $1}
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(sortedMonths, id: \.self){month in
                    NavigationLink(destination: EventsView(month: month, events: eventsByMonth[month] ?? [])){
                        Text(month)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                    }
                    .listRowBackground(Color.clear)
                }
            }
            
            .navigationTitle("Event months")
            .background(Color.mint)
        }
    }
    
    private func convertStringToDate(_ dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString) ?? Date()
    }
}

#Preview {
    MonthView()
}
