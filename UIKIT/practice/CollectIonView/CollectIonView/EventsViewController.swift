import UIKit

class EventsViewController: UICollectionViewController {
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = event?.name
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "detailsCell")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3 
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsCell", for: indexPath)
        
        let label = UILabel()
        
        switch indexPath.item {
        case 0:
            label.text = "Date: \(event?.date ?? "N/A")"
        case 1:
            label.text = "Time: \(event?.time ?? "N/A")"
        case 2:
            label.text = "Location: \(event?.location ?? "N/A")"
        default:
            label.text = ""
        }
        
        label.frame = cell.bounds
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(label)
        
        return cell
    }
}
