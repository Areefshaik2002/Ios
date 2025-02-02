import UIKit

class EventsViewController: UITableViewController {
    
    var eventsByMonth: [String: [Event]] = [:]
    var sortedMonths: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Events"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        loadAndSortEvents()
    }

    func loadAndSortEvents() {
        eventsByMonth = loadEvents()
        sortedMonths = eventsByMonth.keys.sorted { dateString1, dateString2 in
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM yyyy"
            return formatter.date(from: dateString1)! < formatter.date(from: dateString2)!
        }
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedMonths.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedMonths[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let month = sortedMonths[section]
        return eventsByMonth[month]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let month = sortedMonths[indexPath.section]
        if let events = eventsByMonth[month] {
            let event = events[indexPath.row]
            cell.textLabel?.text = "\(event.name) - \(event.date) @ \(event.time)"
        }
        return cell
    }
}
#Preview {
    EventsViewController()
}
