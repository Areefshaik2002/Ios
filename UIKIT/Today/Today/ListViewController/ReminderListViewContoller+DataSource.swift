//
//  ReminderListViewContoller+DataSource.swift
//  Today
//
//  Created by Shaik Areef on 03/02/25.
//

import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String){
        let reminder = Reminder.sampleData[indexPath.item]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = reminder.title
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguration
        
        var backgroundConfiguration = UIBackgroundConfiguration.listCell()
        backgroundConfiguration.backgroundColor = UIColor.init(red: 193/255, green: 215/255, blue: 46/255, alpha: 1)
        cell.backgroundConfiguration = backgroundConfiguration
    }
}


#Preview{
    ReminderListViewController()
}
