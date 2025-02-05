import UIKit

class EventDetailsViewController: EventsViewController {
    
    var event: Event?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = event?.name
        self.view.backgroundColor = .systemMint
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detailsCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath)
        cell.backgroundColor = .white
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Date: \(event?.date ?? "N/A")"
        case 1:
            cell.textLabel?.text = "Time: \(event?.time ?? "N/A")"
        case 2:
            cell.textLabel?.text = "Location: \(event?.location ?? "N/A")"
        default:
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let space = UIView()
        space.backgroundColor = .clear
        return space
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
