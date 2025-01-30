import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var greetingText: UILabel!
    
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
    }

    func greetUser(_ name:String) {
        greetingText.text = "Hello,\(name)"
    }
    
    @IBAction func buttonInAction(_ sender: Any) {
        greetUser("welcome to Tenmates")
        view.backgroundColor = .systemOrange
        
    }
    
}

