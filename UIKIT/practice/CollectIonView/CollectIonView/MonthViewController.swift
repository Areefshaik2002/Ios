import UIKit

class MonthViewController: UICollectionViewController {
    
    var eventsByMonth: [String: [Event]] = [:]
    var sortedMonths: [String] = []

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 50)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Event Months"
        self.navigationItem.prompt = "Tap a month to view events"
        self.view.backgroundColor = .systemBackground
        self.navigationItem.backButtonTitle = "Back"
        self.navigationController?.navigationBar.tintColor = .black
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
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
        
        collectionView.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedMonths.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let month = sortedMonths[indexPath.item]
        
        let label = UILabel()
        label.text = month
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        cell.contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])
        
        cell.backgroundColor = .systemMint
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOpacity = 0.4
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 4
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMonth = sortedMonths[indexPath.item]
        let eventsVC = EventsViewController()
        eventsVC.selectedMonth = selectedMonth
        eventsVC.events = eventsByMonth[selectedMonth] ?? []
        navigationController?.pushViewController(eventsVC, animated: true)
    }
}

#Preview {
    UINavigationController(rootViewController: MonthViewController())
}
