//
//  ViewController.swift
//  UnitConverter
//
//  Created by Shaik Areef on 10/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tempText: UITextField!
    
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func convertTemp(_ sender: Any) {
        guard let tempValue = tempText.text, !tempValue.isEmpty else {
            labelText.text = "Invalid input"
            return
        }
        
        if let celsius = Double(tempValue) {
            let fahrenheit = (celsius * 9.0 / 5.0) + 32
            labelText.text = "\(fahrenheit) °F"
        } else {
            labelText.text = "Enter a valid number"
        }
    }
}
