import UIKit

class ReminderListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
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

        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, String> {
            (cell, indexPath, itemIdentifier) in
            let reminder = Reminder.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = reminder.title
            cell.contentConfiguration = contentConfiguration
        }

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
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}
