import UIKit

class EventDetailsViewController: UIViewController {
    
    var event: Event?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        setupViews()
    }
    
    func setupViews() {
        let nameLabel = UILabel()
        nameLabel.text = "\(event?.name ?? "No name")"
        nameLabel.frame = CGRect(x: 60, y: 300, width: 300, height: 40)
//        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameLabel.backgroundColor = .white
        let formmatedDate = formattedEventDate(from: event?.date ?? "Unknown Date")
        
        let dateLabel = UILabel()
        dateLabel.text = formmatedDate
        dateLabel.frame = CGRect(x: 60, y: 330, width: 300, height: 40)
        dateLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        dateLabel.backgroundColor = .white

        let timeLabel = UILabel()
        timeLabel.text = " \(event?.time ?? "N0 time")"
        timeLabel.frame = CGRect(x: 60, y: 360, width: 300, height: 40)
        timeLabel.backgroundColor = .white
        
        let locationLabel = UILabel()
        locationLabel.text = "\(event?.location ?? "N0 location")"
        locationLabel.frame = CGRect(x: 60, y: 390, width: 300, height: 40)
        locationLabel.backgroundColor = .white

        let stackView: UIStackView = {
                let stack = UIStackView(arrangedSubviews: [dateLabel, nameLabel, timeLabel,         locationLabel])
                    stack.translatesAutoresizingMaskIntoConstraints = false
            stack.backgroundColor = .white
                    stack.layer.cornerRadius = 16
                    stack.axis = .vertical
                    stack.spacing = 12
            stack.alignment = .leading
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
