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
        nameLabel.text = "Event Name: \(event?.name ?? "No name")"
        nameLabel.frame = CGRect(x: 20, y: 100, width: 300, height: 40)
        nameLabel.backgroundColor = .white
        
        let dateLabel = UILabel()
        dateLabel.text = "Date: \(event?.date ?? "No date")"
        dateLabel.frame = CGRect(x: 20, y: 150, width: 300, height: 40)
        
        let timeLabel = UILabel()
        timeLabel.text = "Time: \(event?.time ?? "N0 time")"
        timeLabel.frame = CGRect(x: 20, y: 200, width: 300, height: 40)
        
        let locationLabel = UILabel()
        locationLabel.text = "Location: \(event?.location ?? "N0 location")"
        locationLabel.frame = CGRect(x: 20, y: 250, width: 300, height: 40)
        
        self.view.addSubview(nameLabel)
        self.view.addSubview(dateLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(locationLabel)
    }
    
    
}
