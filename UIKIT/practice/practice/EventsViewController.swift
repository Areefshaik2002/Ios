import UIKit
import Foundation

struct Event: Codable {
    let name: String
    let date: String
    let time: String
    let location: String
}

func eventDate(from dateString: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: dateString)
}

func monthYear(from dateString: String) -> String {
    guard let date = eventDate(from: dateString) else { return "Unknown" }
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy"
    return formatter.string(from: date)
}

func loadEvents() -> [String: [Event]] {
    guard let url = Bundle.main.url(forResource: "events", withExtension: "json") else {
        print("File not found")
        return [:]
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        var events = try decoder.decode([Event].self, from: data)
        
        events.sort {
            (eventDate(from: $0.date) ?? Date()) < (eventDate(from: $1.date) ?? Date())
        }
        
        let groupedEvents = Dictionary(grouping: events) { monthYear(from: $0.date) }
        
        return groupedEvents
    } catch {
        print("Error decoding JSON: \(error)")
        return [:]
    }
}

class LaunchViewContoller: UITableViewController{
    
    override var view: UIView! {
        didSet {
            view.backgroundColor = .white
        }
    }
    
    var eventsByMonth: [String: [Event]] = [:]
    var sortedMonths: [String] = []
    
    override func viewDidLoad() {
        self.title = "Event Months"
        self.navigationItem.prompt = "Tap a month to view events"
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        loadAndSortEvents()

    }
    
    func loadAndSortEvents() {
           eventsByMonth = loadEvents()
           let formatter = DateFormatter()
           formatter.dateFormat = "MMMM yyyy"
           
           sortedMonths = eventsByMonth.keys.sorted { dateString1, dateString2 in
               guard let date1 = formatter.date(from: dateString1),
                  let date2 = formatter.date(from: dateString2) else {
                return false
            }
            return date1 < date2
        }

        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedMonths.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let month = sortedMonths[indexPath.row]
        cell.textLabel?.text = "\(month)\nLocation: Hyderabad"
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMonth = sortedMonths[indexPath.row]
        let eventsVC = EventsViewController()
        eventsVC.selectedMonth = selectedMonth
        eventsVC.events = eventsByMonth[selectedMonth] ?? []
        
        navigationController?.pushViewController(eventsVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}


class EventsViewController: LaunchViewContoller {
    
    var selectedMonth: String?
    var events: [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedMonth
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let events = self.events[indexPath.row]
        cell.textLabel?.text = "\(events.name) on \(events.date) at \(events.time)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEvent = events[indexPath.row]
        let detailsVC = EventDetailsViewController()
        detailsVC.event = selectedEvent
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

class EventDetailsViewController: EventsViewController {
    
    var event: Event?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Event Details"
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        
        let nameLabel = createLabel(text: event?.name ?? "Event Name", fontSize: 24, isBold: true)
        let dateLabel = createLabel(text: "Date: \(event?.date ?? "Unknown")")
        let timeLabel = createLabel(text: " Time: \(event?.time ?? "Unknown")")
        let locationLabel = createLabel(text: " Location: \(event?.location ?? "Unknown")")
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel,dateLabel, timeLabel, locationLabel])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .leading
        
        
        view.addSubview(stackView)
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func createLabel(text: String, fontSize: CGFloat = 18, isBold: Bool = false) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }
}



