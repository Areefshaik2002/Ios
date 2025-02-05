import UIKit

class EventDetailsViewController: EventsViewController {
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.prompt = ""
        self.title = "Event Details"
        self.view.backgroundColor = .systemMint
        guard event != nil else { return }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let event = event else {
            cell.textLabel?.text = "Unknown Event"
            return cell
        }
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = " Name: \(event.name)"
        case 1:
            cell.textLabel?.text = " Date: \(event.date)"
        case 2:
            cell.textLabel?.text = " Time: \(event.time)"
        case 3:
            cell.textLabel?.text = " Location: \(event.location)"
        default:
            break
        }
        cell.selectionStyle = .none
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let space = UIView()
        return space
    }
}
#Preview {
    EventDetailsViewController()
}
