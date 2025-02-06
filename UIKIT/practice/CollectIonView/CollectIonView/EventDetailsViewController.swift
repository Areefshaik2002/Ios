import UIKit

class EventDetailsViewController: UIViewController {
    
    var event: Event?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = event?.name ?? "Event Details"
        self.view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        guard let event = event else { return }
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.backgroundColor = .systemMint
        stackView.layoutMargins = .init(top: 20, left: 20, bottom: 20, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let dateLabel = createLabel(text: "Date: \(event.date)")
        let timeLabel = createLabel(text: "Time: \(event.time)")
        let locationLabel = createLabel(text: "Location: \(event.location)")
        
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(locationLabel)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        return label
    }
}
