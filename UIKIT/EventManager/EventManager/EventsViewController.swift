import UIKit

class EventsViewController: LaunchViewContoller {
    
    var selectedMonth: String?
    var events: [Event]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Events in \(selectedMonth ?? "Unknown Month")"
        self.navigationItem.backButtonTitle = "Back"
        self.navigationItem.prompt = "Tap a cell to view more details"
        self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = .systemMint
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return events?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let events = self.events?[indexPath.section]
        cell.textLabel?.text = events?.name ?? "No Event"
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEvent = events?[indexPath.row]
        let detailsVC = EventDetailsViewController()
        detailsVC.event = selectedEvent
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let space = UIView()
        space.backgroundColor = .clear
        return space
    }
}
#Preview {
    EventsViewController()
}

