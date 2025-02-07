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
        nameLabel.frame = CGRect(x: 60, y: 300, width: 300, height: 40)
        nameLabel.backgroundColor = .init(red: 0.85, green: 1, blue: 0, alpha: 0.85)
        
        let dateLabel = UILabel()
        dateLabel.text = "Date: \(event?.date ?? "No date")"
        dateLabel.frame = CGRect(x: 60, y: 330, width: 300, height: 40)
        dateLabel.backgroundColor = .init(red: 0.85, green: 1, blue: 0, alpha: 0.85)

        let timeLabel = UILabel()
        timeLabel.text = "Time: \(event?.time ?? "N0 time")"
        timeLabel.frame = CGRect(x: 60, y: 360, width: 300, height: 40)
        timeLabel.backgroundColor = .init(red: 0.85, green: 1, blue: 0, alpha: 0.85)
        
        let locationLabel = UILabel()
        locationLabel.text = "Location: \(event?.location ?? "N0 location")"
        locationLabel.frame = CGRect(x: 60, y: 390, width: 300, height: 40)
        locationLabel.backgroundColor = .init(red: 0.85, green: 1, blue: 0, alpha: 0.85)

        let stackView: UIStackView = {
                    let stack = UIStackView(arrangedSubviews: [nameLabel, dateLabel, timeLabel, locationLabel])
                    stack.translatesAutoresizingMaskIntoConstraints = false
            stack.backgroundColor = .init(red: 0.8, green: 1, blue: 0, alpha: 0.85)
                    stack.layer.cornerRadius = 16
                    stack.axis = .vertical
                    stack.spacing = 12
                    stack.alignment = .center
                    stack.isLayoutMarginsRelativeArrangement = true
                    stack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
                    return stack
                }()
                
                view.addSubview(stackView)
                
                NSLayoutConstraint.activate([
                    stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                ])
        
    }
    
    
}
