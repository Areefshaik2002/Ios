import UIKit

class ReminderListViewController: UICollectionViewController {
    
    var dataSource: DataSource!

    // Custom initializer to set the collection view layout
    init() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return NSCollectionLayoutSection.list(using: .init(appearance: .grouped), layoutEnvironment: layoutEnvironment)
        }
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
//      Call the designated initializer
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return NSCollectionLayoutSection.list(using: .init(appearance: .grouped), layoutEnvironment: layoutEnvironment)
        }
        super.init(collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout

        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) { (collectionView, indexPath, itemIdentifier) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }

        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map { $0.title })
        dataSource.apply(snapshot)
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .systemBackground
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}
