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

import UIKit

class LaunchViewController: UITableViewController {
    
    var eventsByMonth: [String: [Event]] = [:]
    var sortedMonths: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Event Months"
        self.navigationItem.prompt = "Tap a month to view events"
        self.view.backgroundColor = .systemMint
        self.navigationItem.backButtonTitle = "Back"
        self.navigationController?.navigationBar.tintColor = .black
        
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
        return sortedMonths.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let month = sortedMonths[section]
        return eventsByMonth[month]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let month = sortedMonths[indexPath.section]
        let event = eventsByMonth[month]?[indexPath.row]
        
        cell.textLabel?.text = event?.name
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedMonths[section]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let month = sortedMonths[indexPath.section]
        let selectedEvent = eventsByMonth[month]?[indexPath.row]
        
        let eventDetailVC = EventDetailsViewController()
        eventDetailVC.event = selectedEvent
        navigationController?.pushViewController(eventDetailVC, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}

import UIKit

class EventDetailsViewController: UIViewController {
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = event?.name
        
        setupViews()
    }
    
    func setupViews() {
        let nameLabel = UILabel()
        nameLabel.text = "Event Name: \(event?.name ?? "N/A")"
        nameLabel.frame = CGRect(x: 20, y: 100, width: 300, height: 40)
        
        let dateLabel = UILabel()
        dateLabel.text = "Date: \(event?.date ?? "N/A")"
        dateLabel.frame = CGRect(x: 20, y: 150, width: 300, height: 40)
        
        let timeLabel = UILabel()
        timeLabel.text = "Time: \(event?.time ?? "N/A")"
        timeLabel.frame = CGRect(x: 20, y: 200, width: 300, height: 40)
        
        let locationLabel = UILabel()
        locationLabel.text = "Location: \(event?.location ?? "N/A")"
        locationLabel.frame = CGRect(x: 20, y: 250, width: 300, height: 40)
        
        self.view.addSubview(nameLabel)
        self.view.addSubview(dateLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(locationLabel)
    }
}
