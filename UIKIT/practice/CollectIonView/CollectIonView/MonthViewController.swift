import UIKit

func eventDate(from date: String) -> String {
    let Formatter = DateFormatter()
    Formatter.dateFormat = "yyyy-MM-dd"
    return Formatter.date(from: date)
}

class MonthViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

