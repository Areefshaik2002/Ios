import UIKit

class LaunchViewController: UITableViewController {
    
    var eventsByMonth: [String: [Event]] = [:]
    var sortedMonths: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Event Schedule"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.prompt = "Tap a month to view events"
        self.view.backgroundColor = .white
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hearderView = UIView()
        hearderView.backgroundColor = .init(red: 193/255, green: 215/255, blue: 46/255, alpha: 1)
        let label = UILabel()
        label.text = sortedMonths[section]
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = sortedMonths[section]
        label.translatesAutoresizingMaskIntoConstraints = false
        hearderView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: hearderView.leadingAnchor, constant: 20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 36).isActive = true
        label.centerYAnchor.constraint(equalTo: hearderView.centerYAnchor).isActive = true
        return hearderView
    }
}
#Preview {
    UINavigationController(rootViewController: LaunchViewController())
}
