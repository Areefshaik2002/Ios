import Foundation

struct Event : Codable {
    let  name : String
    let date : String
    let time : String
    let location : String
}

class EventLoader : ObservableObject {
    @Published var events : [Event] = []
    
    init(){
        loadEvents()
    }
    
    func loadEvents() {
        guard let fileURL = Bundle.main.url(forResource: "events", withExtension: "json") else {
            fatalError("Couldn't find file URL for 'events.json'")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            var events = try JSONDecoder().decode([Event].self, from: data)
        }
        catch {
            fatalError("Error loading events: \(error)")
        }
    }
}


