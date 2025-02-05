
import UIKit

class LaunchViewContoller: UITableViewController{
    
    var eventsByMonth: [String: [Event]] = [:]
    var sortedMonths: [String] = []
    
    override func viewDidLoad() {
        self.title = "Event Months"
        self.navigationItem.prompt = "Tap a month to view events"
        self.view.backgroundColor = .systemMint
        self.navigationItem.backButtonTitle = "Back"
        self.navigationController?.navigationBar.tintColor = .black
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
        return sortedMonths.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let month = sortedMonths[indexPath.section]
        cell.textLabel?.text = month
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .white
        
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let space = UIView()
        space.backgroundColor = .clear
        return space
    }
}
#Preview {
    LaunchViewContoller()
}

