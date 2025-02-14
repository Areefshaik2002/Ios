import SwiftUI

struct EventCalendarView: View {
    let eventsByMonth: [String: [Event]] = loadEvents()
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(eventsByMonth.keys.sorted(by: {
                        guard let date1 = monthYearDate(from: $0),
                              let date2 = monthYearDate(from: $1) else { return false }
                        return date1 < date2
                    }), id: \.self) { month in
                        
                        VStack(alignment: .leading) {
                            Text(month)
                                .font(.title2)
                                .bold()
                                .padding(.leading, 10)
                                .padding(.vertical, 5)
                                .background(Color.green.opacity(0.7))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                                    Text(day)
                                        .font(.subheadline)
                                        .bold()
                                        .frame(width: 40, height: 40)
                                }
                            }
                            
                            LazyVGrid(columns: columns, spacing: 10) {
                                let days = generateDaysForMonth(month)
                                let firstDayOffset = startDayOffset(for: month)
                                
                                ForEach(0..<firstDayOffset, id: \.self) { _ in
                                    Text("")
                                        .frame(width: 40, height: 40)
                                }
                                
                                ForEach(days, id: \.self) { day in
                                    if (eventsByMonth[month]?.first(where: { formattedDay(from: $0.date) == day })) != nil {
                                        Text(day)
                                            .font(.title3)
                                            .bold()
                                            .frame(width: 40, height: 40)
                                            .background(Color.blue.opacity(0.7))
                                            .foregroundColor(.white)
                                            .clipShape(Circle())
                                    } else {
                                        Text(day)
                                            .font(.title3)
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 20)
                    }
                }
                .padding()
            }
        }
    }
    
    func generateDaysForMonth(_ month: String) -> [String] {
        guard let date = monthYearDate(from: month) else { return [] }
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)
        return range?.map { String($0) } ?? []
    }
    
    func startDayOffset(for month: String) -> Int {
        guard let date = monthYearDate(from: month) else { return 0 }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: date)
        
        if let firstDay = calendar.date(from: components),
           let weekday = calendar.dateComponents([.weekday], from: firstDay).weekday {
            return weekday - 1
        }
        return 0
    }
}

#Preview {
    EventCalendarView()
}
