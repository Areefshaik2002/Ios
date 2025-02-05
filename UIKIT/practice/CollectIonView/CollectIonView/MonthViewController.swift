import UIKit

class MonthViewController: UICollectionViewController {
    
    var eventsByMonth: [String: [Event]] = [:]
    var sortedMonths: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Event Months"
        self.navigationItem.prompt = "Tap a month to view events"
        
        collectionView.backgroundColor = .white
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
        return sortedMonths.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let month = sortedMonths[section]
        return eventsByMonth[month]?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let month = sortedMonths[indexPath.section]
        let label = UILabel()
        label.text = month
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        cell.contentView.addSubview(label)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMonth = sortedMonths[indexPath.section]
        let selectedEvent = eventsByMonth[selectedMonth]?[indexPath.item]
        let eventsVC = EventsViewController()
        eventsVC.event = selectedEvent
        navigationController?.pushViewController(eventsVC, animated: true)
    }
}
